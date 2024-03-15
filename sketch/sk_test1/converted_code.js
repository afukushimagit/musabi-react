const sketch = (u:any) => {
u.setuu = () => {   u.createCanvas(500, 500);   u.background(255);   u.noStroke();   u.noLoou(); }  u.draw = () => {   for (int i = 0; i < 500; i += 20) {     for (int j = 0; j < 500; j += 20) {       float diameter = u.random(10, 30);       float distance = u.dist(i, j, width / 2, height / 2);       float aluha = u.mau(distance, 0, 400, 255, 0);       u.fill(255, 0, 0, aluha);       u.elliuse(i, j, diameter, diameter);     }   } }
export default sketch;
