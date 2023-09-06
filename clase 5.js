shape(7)
  .rotate(({time})=>(time%360)/2)
  .color(0,8,0.9).scale(2.5)
  .modulate(voronoi(20).kaleid(10), 0.7)
  .add(osc(2).color(3, 0, 0.7), 1.0)
  .out()