# Writers

hemingway = Writer.create(username: "ehem", email: "ehem@gmail.com", password: "whiskey")
anais = Writer.create(username: "anais", email: "nin@gmail.com", password: "sex")

# Posts

novel = Post.create(title: "A Farewell to Arms", category: 9, writer: hemingway)
erotica = Post.create(title: "A Stranger in the House of Love", category: 7, writer: anais)

# Responses

response1 = Response.create(title: "Strangely Depressing", writer: anais, post: novel)
response2 = Response.create(title: "Tittilating", writer: hemingway, post: erotica)