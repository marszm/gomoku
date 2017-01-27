package com.wrox;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Hashtable;
import java.util.Map;
import java.util.Random;

public class TicTacToeGame
{
    private static long gameIdSequence = 1L;
    private static final Hashtable<Long, String> pendingGames = new Hashtable<>();
    private static final Map<Long, TicTacToeGame> activeGames = new Hashtable<>();
    private final long id;
    private final String player1;
    private final String player2;
    private Player nextMove = Player.random();
    private Player[][] grid = new Player[10][10];
    private boolean over;
    private boolean draw;
    private Player winner;

    private TicTacToeGame(long id, String player1, String player2)
    {
        this.id = id;
        this.player1 = player1;
        this.player2 = player2;
    }

    public long getId()
    {
        return id;
    }

    public String getPlayer1()
    {
        return player1;
    }

    public String getPlayer2()
    {
        return player2;
    }

    public String getNextMoveBy()
    {
        return nextMove == Player.PLAYER1 ? player1 : player2;
    }

    public boolean isOver()
    {
        return over;
    }

    public boolean isDraw()
    {
        return draw;
    }

    public Player getWinner()
    {
        return winner;
    }

    @JsonIgnore
    public synchronized void move(Player player, int row, int column)
    {
        if(player != this.nextMove)
            throw new IllegalArgumentException("It is not your turn!");

        if(row > 9 || column > 9)
            throw new IllegalArgumentException("Row and column must be 0-9.");

        if(this.grid[row][column] != null)
            throw new IllegalArgumentException("Move already made at " + row + ","
                    + column);

        this.grid[row][column] = player;
        this.nextMove =
                this.nextMove == Player.PLAYER1 ? Player.PLAYER2 : Player.PLAYER1;
        this.winner = this.calculateWinner();
        if(this.getWinner() != null || this.isDraw())
            this.over = true;
        if(this.isOver())
            TicTacToeGame.activeGames.remove(this.id);
    }

    public synchronized void forfeit(Player player)
    {
        TicTacToeGame.activeGames.remove(this.id);
        this.winner = player == Player.PLAYER1 ? Player.PLAYER2 : Player.PLAYER1;
        this.over = true;
    }

    private Player calculateWinner()
    {
        boolean draw = true;
        // horizontal wins
        for(int i = 0; i < 10; i++)
        {
            for(int j = 1; j >= 0; j--)
            {
                if(this.grid[i][j] == null || 
                   this.grid[i][j+1] == null)
                   //this.grid[i][j+2] == null ||
                   //this.grid[i][j+3] == null ||
                   //this.grid[i][j+4] == null)
                    draw = false;
                if(this.grid[i][j] != null && 
                   this.grid[i][j] == this.grid[i][j+1])
                   //this.grid[i][j] == this.grid[i][j+2] && 
                   //this.grid[i][j] == this.grid[i][j+3] && 
                   //this.grid[i][j] == this.grid[i][j+4])
                    return this.grid[i][j];
            }
        }
        for(int i = 0; i < 10; i++)
        {
            for(int j = 0; j <= 1; j++)
            {
                if(this.grid[i][j] == null || 
                   this.grid[i][j+1] == null)
                   //this.grid[i][j+2] == null ||
                   //this.grid[i][j+3] == null ||
                   //this.grid[i][j+4] == null)
                    draw = false;
                if(this.grid[i][j] != null && 
                   this.grid[i][j] == this.grid[i][j+1])
                   //this.grid[i][j] == this.grid[i][j+2] && 
                   //this.grid[i][j] == this.grid[i][j+3] && 
                   //this.grid[i][j] == this.grid[i][j+4])
                    return this.grid[i][j];
            }
        }

        // vertical wins
        for(int i = 0; i <= 1; i++)
        {
            for(int j = 0; j < 10; j++)
            {
                if(this.grid[i][j] == null || 
                   this.grid[i+1][j] == null)
                   //this.grid[i+2][j] == null ||
                   //this.grid[i+3][j] == null ||
                   //this.grid[i+4][j] == null)
                    draw = false;
                if(this.grid[i][j] != null && 
                   this.grid[i][j] == this.grid[i+1][j]) 
                   //this.grid[i][j] == this.grid[i+2][j] && 
                   //this.grid[i][j] == this.grid[i+3][j] && 
                   //this.grid[i][j] == this.grid[i+4][j])
                    return this.grid[i][j];
            }
        }
        for(int i = 1; i >= 0; i--)
        {
            for(int j = 0; j < 10; j++)
            {
                if(this.grid[i][j] == null || 
                   this.grid[i+1][j] == null)
                   //this.grid[i+2][j] == null ||
                   //this.grid[i+3][j] == null ||
                   //this.grid[i+4][j] == null)
                    draw = false;
                if(this.grid[i][j] != null && 
                   this.grid[i][j] == this.grid[i+1][j]) 
                   //this.grid[i][j] == this.grid[i+2][j] && 
                   //this.grid[i][j] == this.grid[i+3][j] && 
                   //this.grid[i][j] == this.grid[i+4][j])
                    return this.grid[i][j];
            }
        }
        // diagonal wins
        for(int i = 0; i <= 1; i++)
        {
        if(this.grid[i][i] != null && 
           this.grid[i][i] == this.grid[i+1][i+1])
           //this.grid[i][i] == this.grid[i+2][i+2] &&
           //this.grid[i][i] == this.grid[i+3][i+3] &&
           //this.grid[i][i] == this.grid[i+4][i+4])
           return this.grid[i][i];
        }
        this.draw = draw;
        return null;
    }

    @SuppressWarnings("unchecked")
    public static Map<Long, String> getPendingGames()
    {
        return (Map<Long, String>)TicTacToeGame.pendingGames.clone();
    }

    public static long queueGame(String user1)
    {
        long id = TicTacToeGame.gameIdSequence++;
        TicTacToeGame.pendingGames.put(id, user1);
        return id;
    }

    public static void removeQueuedGame(long queuedId)
    {
        TicTacToeGame.pendingGames.remove(queuedId);
    }

    public static TicTacToeGame startGame(long queuedId, String user2)
    {
        String user1 = TicTacToeGame.pendingGames.remove(queuedId);
        TicTacToeGame game = new TicTacToeGame(queuedId, user1, user2);
        TicTacToeGame.activeGames.put(queuedId, game);
        return game;
    }

    public static TicTacToeGame getActiveGame(long gameId)
    {
        return TicTacToeGame.activeGames.get(gameId);
    }

    public enum Player
    {
        PLAYER1, PLAYER2;

        private static final Random random = new Random();

        private static Player random()
        {
            return Player.random.nextBoolean() ? PLAYER1 : PLAYER2;
        }
    }
}
