window.addEventListener("trix-file-accept", function(event) {
  const acceptedTypes = ['images/jpeg', 'images/png', 'images/gif', 'images/jpg', 'images/heic']
  const maxFileSize = 10064 * 10064 // 10MB

  if(!acceptedTypes.includes(event.file.type) && event.file.size > maxFileSize){
    event.preventDefault()
    alert("Le fichier doit etre une image de moins de 5Mo (.jpg, .png, .jpeg, .gif, .heic)")
  }
})