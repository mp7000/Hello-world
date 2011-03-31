package app
{
	import app.MenuButtonMain;
	
	import flash.display.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.filters.BlurFilter;
	
	

	//ideen er at have et movieclip i library som er linket til denne klasse
	//opret movieclip og add dette til stage
	//se med trace statements om du kan få det til at køre
	//lav beregningerne ift til stage - hust Event.ADDED_TO_STAGE
	
	
	//import statements
	//importer Background klasse
	
	
	public class Background extends MovieClip 
	{
		//Movieclip i library der hedder background1 og background2 som baseclass har denne klasse
		//Declare variables
		private var testObj:MenuButtonMain=new MenuButtonMain();
		
		private var owidth:int = 0;
		private var oheight:int = 0;
		
		private var isVisible:Boolean;
		
		private var container:Sprite = new Sprite();
	//	private var off:Object;
	//	public var bg:Background = new Background();
	
//		private var bg: Background = new Background();
		//private var bg2: background2 = new background2();
		
		//private var bgArray:Array = new Array();
		//bgArray.push(bg1, bg2);
		
		
		//Constructor
		public function Background() 
		{
			//super();
		//	addEventListener(MouseEvent.MOUSE_OVER,test);
		//	trace("hej");
			if(stage)
			init(null)
			else	
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener("Test", test);

			
	//		owidth = bg.width;
			
		//	addEventListener(Event.ADDED_TO_STAGE, initBg);
			
			
			
			
			
			
			
		}
		
		public function init(e:Event):void{	
			
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			this.addEventListener("CustomEvent",test);
			
			var reg2 = stage.stageWidth / 2;
			var reg1 = stage.stageHeight / 2;
			this.x = reg2;
			this.y = reg1;
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			( this.scaleX > this.scaleY ) ? this.scaleY = this.scaleX : this.scaleX = this.scaleY;

		//	this.scaleX <= this.scaleY ? (this.scaleX = this.scaleY) : (this.scaleY = this.scaleX);
			
		//	visible=true;
			owidth = this.width;
			oheight = this.height;
			trace(oheight);
			//trace(owidth);
			//trace(oheight);
		//	stage.scaleMode = StageScaleMode.NO_SCALE;
		//	stage.align = StageAlign.TOP_LEFT;
		//	addChild(bg);
	//		addChild(bg);
			//visible = true;
			//trace("hej ");
		//	this.x=550;
		//	this.y=stage.stageHeight/2;
			stage.addEventListener(Event.RESIZE, handleStageResize);
			//handleStageResize(null);

			
			
		}
		public function test(e:Event):void{
			
			trace("kaj2");
		}

		
		

		
		public function showBg():void{
			//udregn her hvorfra bg skal afspilles, hvis betingelserne er opfyldt
			//trace("kj");
			this.visible = true;
			
			//handleStageResize(null);
			
			//stage.addEventListener(Event.RESIZE, handleStageResize);

			
		}
		
		public function hideBg():void{
			
			this.visible = false;

			
		}

		
		
		
		
		private function handleStageResize(e:Event):void {
			
			var reg2 = stage.stageWidth / 2;
			var reg1 = stage.stageHeight / 2;
			this.x = reg2;
			this.y = reg1;
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			( this.scaleX > this.scaleY ) ? this.scaleY = this.scaleX : this.scaleX = this.scaleY;

			
			//	this.scaleX <= this.scaleY ? (this.scaleX = this.scaleY) : (this.scaleY = this.scaleX);

	/*		trace(stage.width+"  "+ stage.stageHeight+"   bg");
			
			//	visible=true;
			//proportional scale
			if ((stage.stageWidth / stage.stageHeight) > (owidth/oheight)){
				
				this.width = stage.stageWidth;
			
			//	this.scaleY = this.scaleX; 
				trace("hej kurt");
				
			}else{
				
				this.height = stage.stageHeight;
				this.width = stage.stageWidth;
				//this.scaleX = this.scaleY;
				trace("hrj oo");
			}*/
			
			
		}
		
		
		
	}//class
	
	
	
}//Package