<%--@elvariable id="action" type="java.lang.String"--%>
<%--@elvariable id="gameId" type="long"--%>
<%--@elvariable id="username" type="java.lang.String"--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gra :: GOMOKU</title>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<c:url value="/resource/stylesheet/ticTacToe.css" />" />
        <link rel="stylesheet" href="<c:url value="/resource/stylesheet/chat.css" />" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h2>Gra GOMOKU</h2>
        <a href="/ticTacToe/tabe.jsp">Show all results in table !!!</a><br />
        <span class="player-label">YOU:</span> ${username}<br/>
        <span class="player-label">OPONNENT:</span>
        <span id="opponent"><i>Waiting</i></span>
        <div id="status">&nbsp;</div>
        <div id="gameContainer">
            <div class="row">
                <div id="r0c0" class="game-cell" onclick="move(0, 0);">&nbsp;</div>
                <div id="r0c1" class="game-cell" onclick="move(0, 1);">&nbsp;</div>
                <div id="r0c2" class="game-cell" onclick="move(0, 2);">&nbsp;</div>
                <div id="r0c3" class="game-cell" onclick="move(0, 3);">&nbsp;</div>
                <div id="r0c4" class="game-cell" onclick="move(0, 4);">&nbsp;</div>
                <div id="r0c5" class="game-cell" onclick="move(0, 5);">&nbsp;</div>
                <div id="r0c6" class="game-cell" onclick="move(0, 6);">&nbsp;</div>
                <div id="r0c7" class="game-cell" onclick="move(0, 7);">&nbsp;</div>
                <div id="r0c8" class="game-cell" onclick="move(0, 8);">&nbsp;</div>
                <div id="r0c9" class="game-cell" onclick="move(0, 9);">&nbsp;</div>  
            </div>
            <div class="row">
                <div id="r1c0" class="game-cell" onclick="move(1, 0);">&nbsp;</div>
                <div id="r1c1" class="game-cell" onclick="move(1, 1);">&nbsp;</div>
                <div id="r1c2" class="game-cell" onclick="move(1, 2);">&nbsp;</div>
                <div id="r1c3" class="game-cell" onclick="move(1, 3);">&nbsp;</div>
                <div id="r1c4" class="game-cell" onclick="move(1, 4);">&nbsp;</div>
                <div id="r1c5" class="game-cell" onclick="move(1, 5);">&nbsp;</div>
                <div id="r1c6" class="game-cell" onclick="move(1, 6);">&nbsp;</div>
                <div id="r1c7" class="game-cell" onclick="move(1, 7);">&nbsp;</div>
                <div id="r1c8" class="game-cell" onclick="move(1, 8);">&nbsp;</div>
                <div id="r1c9" class="game-cell" onclick="move(1, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r2c0" class="game-cell" onclick="move(2, 0);">&nbsp;</div>
                <div id="r2c1" class="game-cell" onclick="move(2, 1);">&nbsp;</div>
                <div id="r2c2" class="game-cell" onclick="move(2, 2);">&nbsp;</div>
                <div id="r2c3" class="game-cell" onclick="move(2, 3);">&nbsp;</div>
                <div id="r2c4" class="game-cell" onclick="move(2, 4);">&nbsp;</div>
                <div id="r2c5" class="game-cell" onclick="move(2, 5);">&nbsp;</div>
                <div id="r2c6" class="game-cell" onclick="move(2, 6);">&nbsp;</div>
                <div id="r2c7" class="game-cell" onclick="move(2, 7);">&nbsp;</div>
                <div id="r2c8" class="game-cell" onclick="move(2, 8);">&nbsp;</div>
                <div id="r2c9" class="game-cell" onclick="move(2, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r3c0" class="game-cell" onclick="move(3, 0);">&nbsp;</div>
                <div id="r3c1" class="game-cell" onclick="move(3, 1);">&nbsp;</div>
                <div id="r3c2" class="game-cell" onclick="move(3, 2);">&nbsp;</div>
                <div id="r3c3" class="game-cell" onclick="move(3, 3);">&nbsp;</div>
                <div id="r3c4" class="game-cell" onclick="move(3, 4);">&nbsp;</div>
                <div id="r3c5" class="game-cell" onclick="move(3, 5);">&nbsp;</div>
                <div id="r3c6" class="game-cell" onclick="move(3, 6);">&nbsp;</div>
                <div id="r3c7" class="game-cell" onclick="move(3, 7);">&nbsp;</div>
                <div id="r3c8" class="game-cell" onclick="move(3, 8);">&nbsp;</div>
                <div id="r3c9" class="game-cell" onclick="move(3, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r4c0" class="game-cell" onclick="move(4, 0);">&nbsp;</div>
                <div id="r4c1" class="game-cell" onclick="move(4, 1);">&nbsp;</div>
                <div id="r4c2" class="game-cell" onclick="move(4, 2);">&nbsp;</div>
                <div id="r4c3" class="game-cell" onclick="move(4, 3);">&nbsp;</div>
                <div id="r4c4" class="game-cell" onclick="move(4, 4);">&nbsp;</div>
                <div id="r4c5" class="game-cell" onclick="move(4, 5);">&nbsp;</div>
                <div id="r4c6" class="game-cell" onclick="move(4, 6);">&nbsp;</div>
                <div id="r4c7" class="game-cell" onclick="move(4, 7);">&nbsp;</div>
                <div id="r4c8" class="game-cell" onclick="move(4, 8);">&nbsp;</div>
                <div id="r4c9" class="game-cell" onclick="move(4, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r5c0" class="game-cell" onclick="move(5, 0);">&nbsp;</div>
                <div id="r5c1" class="game-cell" onclick="move(5, 1);">&nbsp;</div>
                <div id="r5c2" class="game-cell" onclick="move(5, 2);">&nbsp;</div>
                <div id="r5c3" class="game-cell" onclick="move(5, 3);">&nbsp;</div>
                <div id="r5c4" class="game-cell" onclick="move(5, 4);">&nbsp;</div>
                <div id="r5c5" class="game-cell" onclick="move(5, 5);">&nbsp;</div>
                <div id="r5c6" class="game-cell" onclick="move(5, 6);">&nbsp;</div>
                <div id="r5c7" class="game-cell" onclick="move(5, 7);">&nbsp;</div>
                <div id="r5c8" class="game-cell" onclick="move(5, 8);">&nbsp;</div>
                <div id="r5c9" class="game-cell" onclick="move(5, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r6c0" class="game-cell" onclick="move(6, 0);">&nbsp;</div>
                <div id="r6c1" class="game-cell" onclick="move(6, 1);">&nbsp;</div>
                <div id="r6c2" class="game-cell" onclick="move(6, 2);">&nbsp;</div>
                <div id="r6c3" class="game-cell" onclick="move(6, 3);">&nbsp;</div>
                <div id="r6c4" class="game-cell" onclick="move(6, 4);">&nbsp;</div>
                <div id="r6c5" class="game-cell" onclick="move(6, 5);">&nbsp;</div>
                <div id="r6c6" class="game-cell" onclick="move(6, 6);">&nbsp;</div>
                <div id="r6c7" class="game-cell" onclick="move(6, 7);">&nbsp;</div>
                <div id="r6c8" class="game-cell" onclick="move(6, 8);">&nbsp;</div>
                <div id="r6c9" class="game-cell" onclick="move(6, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r7c0" class="game-cell" onclick="move(7, 0);">&nbsp;</div>
                <div id="r7c1" class="game-cell" onclick="move(7, 1);">&nbsp;</div>
                <div id="r7c2" class="game-cell" onclick="move(7, 2);">&nbsp;</div>
                <div id="r7c3" class="game-cell" onclick="move(7, 3);">&nbsp;</div>
                <div id="r7c4" class="game-cell" onclick="move(7, 4);">&nbsp;</div>
                <div id="r7c5" class="game-cell" onclick="move(7, 5);">&nbsp;</div>
                <div id="r7c6" class="game-cell" onclick="move(7, 6);">&nbsp;</div>
                <div id="r7c7" class="game-cell" onclick="move(7, 7);">&nbsp;</div>
                <div id="r7c8" class="game-cell" onclick="move(7, 8);">&nbsp;</div>
                <div id="r7c9" class="game-cell" onclick="move(7, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r8c0" class="game-cell" onclick="move(8, 0);">&nbsp;</div>
                <div id="r8c1" class="game-cell" onclick="move(8, 1);">&nbsp;</div>
                <div id="r8c2" class="game-cell" onclick="move(8, 2);">&nbsp;</div>
                <div id="r8c3" class="game-cell" onclick="move(8, 3);">&nbsp;</div>
                <div id="r8c4" class="game-cell" onclick="move(8, 4);">&nbsp;</div>
                <div id="r8c5" class="game-cell" onclick="move(8, 5);">&nbsp;</div>
                <div id="r8c6" class="game-cell" onclick="move(8, 6);">&nbsp;</div>
                <div id="r8c7" class="game-cell" onclick="move(8, 7);">&nbsp;</div>
                <div id="r8c8" class="game-cell" onclick="move(8, 8);">&nbsp;</div>
                <div id="r8c9" class="game-cell" onclick="move(8, 9);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r9c0" class="game-cell" onclick="move(9, 0);">&nbsp;</div>
                <div id="r9c1" class="game-cell" onclick="move(9, 1);">&nbsp;</div>
                <div id="r9c2" class="game-cell" onclick="move(9, 2);">&nbsp;</div>
                <div id="r9c3" class="game-cell" onclick="move(9, 3);">&nbsp;</div>
                <div id="r9c4" class="game-cell" onclick="move(9, 4);">&nbsp;</div>
                <div id="r9c5" class="game-cell" onclick="move(9, 5);">&nbsp;</div>
                <div id="r9c6" class="game-cell" onclick="move(9, 6);">&nbsp;</div>
                <div id="r9c7" class="game-cell" onclick="move(9, 7);">&nbsp;</div>
                <div id="r9c8" class="game-cell" onclick="move(9, 8);">&nbsp;</div>
                <div id="r9c9" class="game-cell" onclick="move(9, 9);">&nbsp;</div>
            </div>
              </div>
        <div id="chatContainer"> 
            <div id="chatLog"> </div>
            <div id="messageContainer">
                <textarea id="messageArea"></textarea>
            </div>
            <div id="buttonContainer">
                <button class="btn btn-primary" onclick="send();">Send</button>
                
                <form action="/game-site/dataBase">
                    <input type="hidden" name="user" value="username">
                    <input type="submit" value="Submit"/>
                </form>
            </div>
        </div>
        
        <div id="modalError" class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>Error</h3>
            </div>
            <div class="modal-body" id="modalErrorBody">A blah error occurred.</div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
        
        <div id="modalWaiting" class="modal hide fade">
            <div class="modal-header"><h3>Please Wait...</h3></div>
            <div class="modal-body" id="modalWaitingBody">&nbsp;</div>
        </div>
        <div id="modalError" class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;
                </button>
                <h3>Error</h3>
            </div>
            <div class="modal-body" id="modalErrorBody">A blah error occurred.
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
        
        <div id="modalGameOver" class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;
                </button>
                <h3>Game Over</h3>
            </div>
            <div class="modal-body" id="modalGameOverBody">&nbsp;</div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
        
        <script type="text/javascript" language="javascript">
            var move, send;
            $(document).ready(function() {
                var chatLog = $("#chatLog");
                var modalError = $("#modalError");
                var modalErrorBody = $("#modalErrorBody");
                var modalWaiting = $("#modalWaiting");
                var modalWaitingBody = $("#modalWaitingBody");
                var modalGameOver = $("#modalGameOver");
                var modalGameOverBody = $("#modalGameOverBody");
                var opponent = $("#opponent");
                var status = $("#status");
                var opponentUsername;
                var username = '<c:out value="${username}" />';
                var myTurn = false;
                var messageArea = $("#messageArea");
                $('.game-cell').addClass('span1');

                if(!("WebSocket" in window))
                {
                    modalErrorBody.text('WebSockets are not supported in this ' +
                            'browser. Try Internet Explorer 10 or the latest ' +
                            'versions of Mozilla Firefox or Google Chrome.');
                    modalError.modal('show');
                    return;
                }
                
                modalWaitingBody.text('Connexting to server.');
                modalWaiting.modal({ keyboard: false, show: true });

                var server;
                try {
                    server = new WebSocket('ws://' + window.location.host +
                            '<c:url value="/ticTacToe/${gameId}/${username}">
                                <c:param name="action" value="${action}" />
                            </c:url>');
                } catch(error) {
                    modalWaiting.modal('hide');
                    modalErrorBody.text(error);
                    modalError.modal('show');
                    return;
                }
                
                server.onopen = function(event) {
                    chatLog.text('WELCOME TO CHAT');
                    modalWaitingBody.text('Awaitiing for oponent');
                    modalWaiting.modal({ keyboard: false, show: true });
                    
                };

                window.onbeforeunload = function() {
                    server.close();
                };

                server.onclose = function(event) {
                    if(!event.wasClean || event.code != 1000) {
                        toggleTurn(false, 'game over - error!');
                        modalWaiting.modal('hide');
                        modalErrorBody.text('Code ' + event.code + ': ' + event.reason);
                        modalError.modal('show');
                    }
                };

                server.onerror = function(event) {
                    modalWaiting.modal('hide');
                    modalErrorBody.text(event.data);
                    modalError.modal('show');
                };
                
                server.onmessage = function(event) {
                    var message = JSON.parse(event.data);
                    if(message.action == 'gameStarted') {
                        if(message.game.player1 == username)
                            opponentUsername = message.game.player2;
                        else
                            opponentUsername = message.game.player1;
                        opponent.text(opponentUsername);
                        toggleTurn(message.game.nextMoveBy == username);
                        modalWaiting.modal('hide');
                    } else if(message.action == 'opponentMadeMove') {
                        $('#r' + message.move.row + 'c' + message.move.column)
                                .unbind('click')
                                .removeClass('game-cell-selectable')
                                .addClass('game-cell-opponent game-cell-taken');
                        toggleTurn(true);
                    } else if(message.action == 'gameOver') {
                        toggleTurn(false, 'game over!');
                        if(message.winner) {
                            modalGameOverBody.text('congratulations you are winner');
                        } else {
                            modalGameOverBody.text('username "' + opponentUsername + '" is winner.');
                        }
                        modalGameOver.modal('show');
                        //databsae
                    } else if(message.action == 'gameIsDraw') {
                        toggleTurn(false, 'draw. ' + 'no winner.');
                        modalGameOverBody.text('draw. ' + 'no winner!');
                        modalGameOver.modal('show');
                    } else if(message.action == 'gameForfeited') {
                        toggleTurn(false, 'Twój przeciwnik utracił!');
                        modalGameOverBody.text('user "' + opponentUsername + '" zrezygnował z gry. Ty wygrałeś!');
                        modalGameOver.modal('show');
                    }else if (message.action == 'chatmessgaesent') {
                            $('#chatLog').append('<div>' + message.user + '  :  ' + message.content + '</div>');
                     }
                };
                
                var toggleTurn = function(isMyTurn, message) {
                    myTurn = isMyTurn;
                    if(myTurn) {
                        status.text(message || 'your move!');
                        $('.game-cell:not(.game-cell-taken)').addClass('game-cell-selectable');
                    } else {
                        status.text(message ||'awaiting for opponent move.');
                        $('.game-cell-selectable').removeClass('game-cell-selectable');
                    }
                };
                
                move = function(row, column) {
                    if(!myTurn) {
                        modalErrorBody.text('oponnent move!');
                        modalError.modal('show');
                        return;
                    }
                    if(server != null) {
                        server.send(JSON.stringify({ row: row, column: column }));
                                             
                        $('#r' + row + 'c' + column).unbind('click')
                                .removeClass('game-cell-selectable')
                                .addClass('game-cell-player game-cell-taken');
                        toggleTurn(false);
                    } else {
                        modalErrorBody.text('server connection error.');
                        modalError.modal('show');
                    }
                };
                save = function() {
                    
                };
                send = function() {
                    var message = {
                            user: username,
                            content: messageArea.get(0).value
                        };
                    if(messageArea.get(0).value.trim().length > 0) {
                        try {
                           if(server != null) {
                            server.send(JSON.stringify(message));
                            $('#chatLog').append('<div>' + message.user + '  :  ' + message.content + '</div>');
                           }
                            messageArea.get(0).value = '';
                        } catch(error) {
                            modalErrorBody.text(error);
                            modalError.modal('show');
                        }
                    }
                };
            });
        </script>
    </body>
</html>
