let () =
  Dream.run @@ Dream.logger
  @@ Dream.router
       [ ( Dream.get "/echo/:word"
         @@ fun request -> Dream.html @@ Dream.param request "word" )
       ; (Dream.get "/" @@ fun _ -> Dream.html "Hi there") ]
