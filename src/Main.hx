package;
using Main;

class Main 
{
    static var _gotCount = 0;
	static var sb = new StringBuf();
	
	static public inline function append<T>(sb : StringBuf, s : T) : StringBuf
	{
		sb.add(s);
		return sb;
	}
	
	static function main() 
	{
		var t = haxe.Timer.stamp();
		TryPress(new Board(), 7);
		sb.append("---------end----------\n");
		sb.append("----" + _gotCount + "----\n");
		sb.append("Elapsed time : " + ( haxe.Timer.stamp() - t));
		trace(sb.toString());
	}
	
	private static function TryPress(board : Board, y : Int) : Void
	{
		for (x in 0...8) {
			if (board.IsEmpty(x, y)) {
				var b = Press(board.clone(), x, y);
				if (y > 0) {
					TryPress(b, y - 1);
				} else {
					_gotCount++;
					PrintBoard(b, "---got");
					return;
				}
			}
		}
	}
	
	static function PrintBoard(board : Board, msg : String = "") : Void
	{
		sb.append("-------------------").append(msg).append("----").append(_gotCount).append("\n");
		for (x in 0...8) {
			for (y in 0...8) {
				sb.append(board.HasChess(x, y) ? "@" : board.AtAttackZone(x, y) ? "#" : ".");
			}
			sb.append("\n");
		}
	}
	
	static function Press(board : Board, x : Int, y : Int) : Board
	{
		board.PutChess(x, y);
		for (i in 0...8) {
			board.SetAttackZone(x, i);
		}
		for (i in 0...8) {
			board.SetAttackZone(i, y);
		}
		var x0 = x, y0 = y;
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
