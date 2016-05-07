using System;
using System.Collections.Generic;

namespace EightQueen
{
    struct Board
    {
        public ulong ChessBoard;
        public ulong AttackBoard;

        public bool HasChess(int x, int y)
        {
            var n = GetMask(x, y);
            return (ChessBoard & n) != 0;
        }

        public bool AtAttackZone(int x, int y)
        {
            var n = GetMask(x, y);
            return (AttackBoard & n) != 0;
        }

        public bool IsEmpty(int x, int y)
        {
            var n = GetMask(x, y);
            return (ChessBoard & n) == 0 && (AttackBoard & n) == 0;
        }

        public void PutChess(int x, int y)
        {
            var n = GetMask(x, y);
            if ((ChessBoard & n) == 0 && (AttackBoard & n) == 0)
            {
                ChessBoard |= n;
            }
        }

        public void SetAttackZone(int x, int y)
        {
            var n = GetMask(x, y);
            if ((ChessBoard & n) == 0 && (AttackBoard & n) == 0)
            {
                AttackBoard |= n;
            }
        }

        private static ulong GetMask(int x, int y)
        {
            return (1ul << x) << (y * 8);
        }
    }

    class Program
    {
        private static int _gotCount;

        static void Main(string[] args)
        {
            var t = DateTime.Now;
            TryPress(new Board(), 7);
            Console.WriteLine("---------end----------");
            Console.WriteLine("----" + _gotCount + "----");
            Console.WriteLine($"Elapsed time : {DateTime.Now - t}");
        }

        private static void TryPress(Board board, int y)
        {
            for (int x = 0; x < 8; x++)
            {
                if (board.IsEmpty(x, y))
                {
                    var b = Press(board, x, y);
                    if (y > 0)
                    {
                        TryPress(b, y - 1);
                    }
                    else
                    {
                        _gotCount++;
                        PrintBoard(b, "---got");
                        return;
                    }
                }
            }
        }

        static void PrintBoard(Board board, string msg = "")
        {
            Console.WriteLine("-------------------" + msg + "----" + _gotCount);
            for (int x = 0; x < 8; x++)
            {
                for (int y = 0; y < 8; y++)
                {
                    Console.Write(board.HasChess(x,y) ? "@" : board.AtAttackZone(x, y) ? "#" : ".");
                }
                Console.WriteLine();
            }
        }

        static Board Press(Board board, int x, int y)
        {
            board.PutChess(x, y);
            for (int i = 0; i < 8; i++)
            {
                board.SetAttackZone(x, i);
            }
            for (int i = 0; i < 8; i++)
            {
                board.SetAttackZone(i, y);
            }
            int x0 = x, y0 = y;
            while (x0 >= 0 && y0 >= 0)
            {
                board.SetAttackZone(x0, y0);
                x0--;
                y0--;
            }
            x0 = x; y0 = y;
            while (x0 >= 0 && y0 < 8)
            {
                board.SetAttackZone(x0, y0);
                x0--;
                y0++;
            }
            x0 = x; y0 = y;
            while (x0 < 8 && y0 >= 0)
            {
                board.SetAttackZone(x0, y0);
                x0++;
                y0--;
            }
            x0 = x; y0 = y;
            while (x0 < 8 && y0 < 8)
            {
                board.SetAttackZone(x0, y0);
                x0++;
                y0++;
            }
            return board;
        }
    }
}
