function angle_in_degrees = vector2angle(u,v)
  
  a= sqrt(u(1)^2+u(2)^2+u(3)^2);
  b=sqrt(v(1)^2+v(2)^2+v(3)^2);
  c=0;
  
  for i=1:1:numel(u)
      c=c+u(i)*v(i);
  
  end
  
  angle_in_degrees=acos(c/(a*b))*180/pi
  
end