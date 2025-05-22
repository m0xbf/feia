# This is just an example to get you started. Users of your hybrid library will
# import this file by writing ``import feiapkg/submodule``. Feel free to rename or
# remove this file altogether. You may create additional modules alongside
# this file as required.

proc getWelcomeMessage*(): string =
  "Hello, World!"

import mummy, mummy/routers

proc indexHandler(request: Request) =
  var headers: HttpHeaders
  headers["Content-Type"] = "text/plain"
  request.respond(200, headers, "Hello, World!")

proc runWeb*() =
  var router: Router
  router.get("/", indexHandler)

  let server = newServer(router)
  echo "Serving on http://localhost:8080"
  server.serve(Port(8080))
