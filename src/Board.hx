package;

class Board
{
	var _board : Array<Int> = [
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0];
	
	public function new()
	{
	}

	public function clone() : Board
	{
		var r = new Board();
		for(i in 0...64) {
			r._board[i] = _board[i];
		}
		return r;
	}

	public function HasChess(x : Int, y : Int) : Bool
	{
		var n = GetMask(x, y);
		return _board[n] == 1;
	}

	public function AtAttackZone(x : Int, y : Int) : Bool
	{
		var n = GetMask(x, y);
		return _board[n] == 2;
	}

	public function IsEmpty(x : Int, y : Int) : Bool
	{
		var n = GetMask(x, y);
		return _board[n] == 0;
	}

	public function PutChess(x : Int, y : Int) : Void
	{
		var n = GetMask(x, y);
		if (_board[n] == 0) {
			_board[n] = 1;
		}
	}

	public function SetAttackZone(x : Int, y : Int) : Void
	{
		var n = GetMask(x, y);
		if (_board[n] == 0) {
			_board[n] = 2;
		}
	}

	private function GetMask(x : Int, y : Int) : Int
	{
		return x + y * 8;
	}
}
