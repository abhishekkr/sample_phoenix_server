let Scuttlebutt = {
  init(socket) {
    let channel = socket.channel('scuttlebutt:lobby', {})
    channel.join()
    this.listenFotChats(channel)
  },

  listenFotChats(channel) {
    document.getElementById('chat-form').addEventListener('submit', function(e){
        e.preventDefault()

        let msg_from = document.getElementById('user-name').value
        let msg = document.getElementById('user-msg').value

        channel.push('shout', {from: msg_from, msg: msg})

        document.getElementById('user-msg').value = ''
      })

    channel.on('shout', payload => {
        let msg_block = document.createElement('div')
        msg_block.insertAdjacentHTML('beforeend', `<b>${payload.from}:</b> ${payload.msg}`)
        document.querySelector('#chat-box').appendChild(msg_block)
      })
  }
}

export default Scuttlebutt
