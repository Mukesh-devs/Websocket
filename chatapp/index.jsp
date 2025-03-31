<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WebSocket Chat</title>
    <script>
        var socket;
        function connect() {
            socket = new WebSocket("ws://localhost:8080/chatapp/chat");

            socket.onopen = function() {
                console.log("Connected to server");
            };

            socket.onmessage = function(event) {
                var message = event.data;
                var chatBox = document.getElementById('chatBox');
                chatBox.innerHTML += "<p>" + message + "</p>";
            };

            socket.onclose = function() {
                console.log("Connection closed");
            };

            socket.onerror = function(error) {
                console.log("Error: " + error);
            };
        }

        function sendMessage() {
            var message = document.getElementById("messageInput").value;
            socket.send(message);
            document.getElementById("messageInput").value = "";
        }

        function disconnect() {
            socket.close();
        }
    </script>
</head>
<body onload="connect();">
    <h2>WebSocket Chat</h2>
    <div id="chatBox" style="border:1px solid #ccc; padding:10px; height:300px; overflow-y:auto;"></div>
    <input type="text" id="messageInput" placeholder="Type your message here..." />
    <button onclick="sendMessage();">Send</button>
    <button onclick="disconnect();">Disconnect</button>
</body>
</html>
