package {
	import flash.display.*;
	import flash.text.*;
	import flash.filters.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.geom.Point;
	import flash.net.*;
	import flash.system.*;
	
	public class Hilbert extends Sprite{
		public var start_x:Number;
		public var start_y:Number;
		public var i:int;
		public var obj_line:Array = new Array();
		public var start_flag:String
		public var u:Number;
		public var point_x:Number;
		public var point_y:Number;
		public var timer:Timer;
		
		public function Hilbert(){
			timer = new Timer(1, 0);
			timer.addEventListener(TimerEvent.TIMER,onTick);
			
			stage.align=StageAlign.TOP_LEFT;
			
			point_x = stage.stageWidth -21;
			point_y = 47;
			i = 6;
			u = 4;
			A();
			timer.start();
		}
		private function onTick(evt:TimerEvent):void{
			if(obj_line.length != 0){
				addChild(obj_line[0]);
				obj_line.shift();
			}
		}
		public function A():void{
			if(i > 0){
				i--;
				D();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x - u,point_y,0xff0000);
			point_x = point_x - u;
			point_y = point_y;
			obj_line.push(line);
			
			if(i > 0){
				i--;
				A();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x,point_y + u,0xff0000);
			point_x = point_x;
			point_y = point_y + u;
			obj_line.push(line);
			
			if(i > 0){
				i--;
				A();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x + u,point_y,0xff0000);
			point_x = point_x + u;
			point_y = point_y;
			obj_line.push(line);
			
			if(i > 0){
				i--;
				B();
				i++;
			}

		}
		public function B():void{
			if(i > 0){
				i--;
				C();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x,point_y - u,0x000000);
			point_x = point_x;
			point_y = point_y - u;
			obj_line.push(line);
			if(i > 0){
				i--;
				B();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x + u,point_y,0x000000);
			point_x = point_x + u;
			point_y = point_y;
			obj_line.push(line);
			if(i > 0){
				i--;
				B();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x,point_y + u,0x000000);
			point_x = point_x;
			point_y = point_y + u;
			obj_line.push(line);
			if(i > 0){
				i--;
				A();
				i++;
			}
		}
		public function C():void{
			if(i > 0){
				i--;
				B();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x + u,point_y,0x00ff00);
			point_x = point_x + u;
			point_y = point_y;
			obj_line.push(line);
			if(i > 0){
				i--;
				C();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x,point_y - u,0x00ff00);
			point_x = point_x;
			point_y = point_y - u;
			obj_line.push(line);
			if(i > 0){
				i--;
				C();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x - u,point_y,0x00ff00);
			point_x = point_x - u;
			point_y = point_y;
			obj_line.push(line);
			if(i > 0){
				i--;
				D();
				i++;
			}
		}
		public function D():void{
			if(i > 0){
				i--;
				A();
				i++;
			}
			var line:Shape = makeLine(point_x,point_y,point_x,point_y + u,0x0000ff);
			point_x = point_x;
			point_y = point_y + u;
			obj_line.push(line);
			if(i > 0){
				i--;
				D();
				i++;
				
			}
			var line:Shape = makeLine(point_x,point_y,point_x - u,point_y,0x0000ff);
			point_x = point_x - u;
			point_y = point_y;
			obj_line.push(line);
			if(i > 0){
				i--;
				D();
				i++;
				
			}
			var line:Shape = makeLine(point_x,point_y,point_x,point_y - u,0x0000ff);
			point_x = point_x;
			point_y = point_y - u;
			obj_line.push(line);
			if(i > 0){
				i--;
				C();
				i++;
				
			}
		}
		private function makeLine(x0:int,y0:int,x1:int,y1:int,color:uint):Shape{
			var line:Shape = new Shape();
			line.graphics.lineStyle(0,color);
			line.graphics.moveTo(x0,y0);
			line.graphics.lineTo(x1,y1);
			return line;
		}
	}
}
