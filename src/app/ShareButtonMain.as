package app
{
	import flash.display.MovieClip;
	
	public class ShareButtonMain extends MovieClip
	{
		var _twitter:twitter = new twitter();
		
		public function ShareButtonMain()
		{
			stage.addChildAt(this,1);
			_twitter.x=200;
			_twitter.y=100;
			trace("fdgkfdk.gjdfg.kdfjgdf.gdfjg");
			addChildAt(_twitter,2);
			super();
		}
	}
}