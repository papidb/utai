let count = ref 0

let count_requests inner_handler request =
  count := !count + 1 ;
  inner_handler request

let handle_home _ = Dream.html (Printf.sprintf "Saw %i request(s)!" !count)

let handle_echo request = Dream.html (Dream.param request "word")

let () =
  Dream.run @@ Dream.logger @@ count_requests
  @@ Dream.router
       [Dream.get "/" handle_home; Dream.get "/echo/:word" handle_echo]
