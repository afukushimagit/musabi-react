const sketch = (p) => {
    p.setup = () => {
      p.createCanvas(500, 500);
      p.background(255);
      p.noStroke();
      p.noLoop();
      console.log("ss"); // 正しいログ出力
    };
  
    p.draw = () => {
      for (let i = 0; i < 500; i += 20) {
        for (let j = 0; j < 500; j += 20) {
          let diameter = p.random(10, 30);
          let distance = p.dist(i, j, p.width / 2, p.height / 2);
          let alpha = p.map(distance, 0, 400, 255, 0);
          p.fill(255, 0, 0, alpha);
          p.ellipse(i, j, diameter, diameter);
        }
      }
    };
  };
