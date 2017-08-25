<loader>
  <div class="cube-container">
    <div class="cube1 cube"></div>
    <div class="cube2 cube"></div>
    <div class="cube4 cube"></div>
    <div class="cube3 cube"></div>
  </div>
  <div class='shadow'></div>
  <style>
    .cube-container {
      margin: 20px auto;
      width: 40px;
      height: 40px;
      position: relative;
      transform: rotateZ(45deg);
    }

    .shadow {
      margin-top: 20px;
      width: 40px;
      height: 80px;
      border-radius: 100%;
      transform: rotateX(70deg) scale(1.3);
      background: radial-gradient(circle at center, rgba(0,0,0,0.08) 0, rgba(0,0,0,0) 60%, rgba(0,0,0,0) 100%);
    }

    .cube {
      float: left;
      width: 50%;
      height: 50%;
      position: relative;
      transform: scale(1.1);
    }

    .cube:before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: #81505d;
      animation: sk-foldCubeAngle 2.4s infinite linear both;
      transform-origin: 100% 100%;
    }

    .cube2 {
      transform: scale(1.1) rotateZ(90deg);
    }

    .cube3 {
      transform: scale(1.1) rotateZ(180deg);
    }

    .cube4 {
      transform: scale(1.1) rotateZ(270deg);
    }

    .cube2:before {
      animation-delay: 0.3s;
    }

    .cube3:before {
      animation-delay: 0.6s;
    }

    .cube4:before {
      animation-delay: 0.9s;
    }

    @keyframes sk-foldCubeAngle {
      0%, 10% {
        transform: perspective(140px) rotateX(-180deg);
        opacity: 0;
      }

      25%, 75% {
        transform: perspective(140px) rotateX(0deg);
        opacity: 1;
      }

      90%, 100% {
        transform: perspective(140px) rotateY(180deg);
        opacity: 0;
      }
    }
  </style>
</loader>