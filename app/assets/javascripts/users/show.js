$(() => {
  const userId = $('user').dataset.id

  fetch(`/users/${userId}`)
})
