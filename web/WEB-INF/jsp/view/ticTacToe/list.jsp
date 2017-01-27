<%--@elvariable id="pendingGames" type="java.util.Map<long, java.Lang.String>"--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gra HELLO:: GOMOKU</title>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    </head>
    <body>
        <h2>Gra GOMOKU</h2>
        <a href="javascript:void 0;" onclick="startGame();">Rozpocznij gre !</a><br />
        <br />
        <c:choose>
            <c:when test="${fn:length(pendingGames) == 0}">
                <i>Brak istniejących gier do dołączenia.</i>
            </c:when>
            <c:otherwise>
                Dołącz do gry i oczekuj na drugiego gracza:<br />
                <c:forEach items="${pendingGames}" var="e">
                    <a href="javascript:void 0;"
                       onclick="joinGame(${e.key});">User: ${e.value}</a><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>

        <script type="text/javascript" language="javascript">
            var startGame, joinGame;
            $(document).ready(function() {
                var url = '<c:url value="/ticTacToe" />';

                startGame = function() {
                    var username = prompt('Podaj nazwe użytkownika aby dołączyć do gry.', '');
                    if(username != null && username.trim().length > 0 &&
                            validateUsername(username))
                        post({action: 'start', username: username});
                };

                joinGame = function(gameId) {
                    //alert('inside join game');
                    
                    var username =
                            prompt('Podaj nazwe użytkownika aby dołączyć do gry.', '');
                    if(username != null && username.trim().length > 0 &&
                            validateUsername(username))
                        post({action: 'join', username: username, gameId: gameId});
                };

                var validateUsername = function(username) {
                    var valid = username.match(/^[a-zA-Z0-9_]+$/) != null;
                    if(!valid)
                        alert('Nazwa użytkownika może zawierac tylko litery, liczby ' +
                                'i podkreslenie.');
                    return valid;
                };

                var post = function(fields) {
                    
                    var form = $('<form id="mapForm" method="post"></form>')
                            .attr({ action: url, style: 'display: none;' });
                    for(var key in fields) {
                       
                        if(fields.hasOwnProperty(key))
                            form.append($('<input type="hidden">').attr({
                                name: key, value: fields[key]
                            }));
                    }
                    $('body').append(form);
                    form.submit();
                };
            });
        </script>
    </body>
</html>
