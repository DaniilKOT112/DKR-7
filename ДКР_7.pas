Uses  GraphABC;
var (m,wx,wy,g) := (200, 500,450,5);
 
Procedure ris(x,y,a,r:real;k:integer);
begin
     if k>0 then 
 begin
  r:=r*sin(pi/4);
  ris(x,y,a+pi/4,r,k-1);
  ris(x+r*cos(a+pi/4),y-r*sin(a+pi/4),a-pi/4,r,k-1);
 end 
else
line(trunc(x),trunc(y),trunc(x+r*cos(a)),trunc(y-r*sin(a))); 
end; 

 
Procedure KeyDown(k: integer);
begin
 case K of
    VK_Down: wy -= 10;
    VK_Up: wy += 10; 
    VK_Left: wx += 10;  
    VK_Right: wx -= 10;
    VK_Escape: halt(1); //выход
    VK_A: if m < 1000 then m+=1;
    VK_Z: if m > 10 then m-=1;
    VK_S: if g < 15 then g+=1;
    VK_X: if g > 2 then g -=1;
   end;
 Window.Clear; 
 ris(wx-m,wy,wx+m,wy,g);
 Redraw;
end; 
 
Begin
     SetPenColor(clRed);
     SetWindowCaption('Кривая Леви');
     SetWindowSize(800, 600);
     LockDrawing;
     KeyDown(0);
     OnkeyDown += KeyDown;
End.