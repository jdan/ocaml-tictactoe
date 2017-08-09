let css = "
body {
  margin: 0;
  padding: 0;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

main {
  margin: auto;
}
"

let layout title body = "
<!doctype html>
<html>
<head>
  <title>" ^ title ^ "</title>
  <style>" ^ css ^ "</style>
</head>
<body>
  <main>" ^ body ^ "</main>
  <script src='/socket.io/socket.io.js'></script>
  <script src='/client.js'></script>
</body>
</html>
"
