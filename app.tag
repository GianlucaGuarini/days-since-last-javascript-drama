<app>
  <fork/>
  <button
    data-is='animore'
    if={ !isLoading }
    disabled={ index === 0 }
    onclick={ prev }
    mount={{
      translateX: [-100, 0]
    }}
    title='Previous Drama'
    class='prev'
  >&lt;</button>

  <button
    data-is='animore'
    if={ !isLoading }
    mount={{
      translateX: [100, 0]
    }}
    disabled={ dramas && index === dramas.length - 1 }
    onclick={ next }
    title='Next Drama'
    class='next'
  >&gt;</button>

  <div
    class='timer'
    if={!isLoading && event}
    data-is='animore'
    update={{
      easing: 'easeOutQuad',
      duration: 250,
      scale: [1, 0.92, 1]
    }}
    mount={{
      easing: 'easeInOutQuad',
      duration: 200,
      scale: [0, 1]
    }}>
    <timer
      date={event.date}
      title={event.title}
      link={event.link}
      />
  </div>

  <div
    class='loader'
    if={isLoading}
    data-is='animore'
    unmount={{
      duration: 1000,
      scale: [1, 0]
    }}>
    <loader/>
  </div>
  <script>
    load() {
      fetch('./dramas.json')
        .then(data => data.json())
        .then(this.ready)
    }

    ready(dramas) {
      this.index = 0
      this.dramas = dramas
      this.isLoading = false
      this.changeDrama()
      this.update()
    }

    changeDrama() {
      this.event = this.dramas[this.index]
    }

    next() {
      this.index++
      this.changeDrama()
    }

    prev() {
      this.index--
      this.changeDrama()
    }

    this.dramas = null
    this.event = null
    this.isLoading = true

    setTimeout(this.load, 1000)
  </script>
  <style>
    :scope {
      display: block;
      width: 100%;
      height: 100vh;
    }

    .prev,
    .next {
      cursor: pointer;
      z-index: 1;
      color: #81505d;
      position: absolute;
      top: 50%;
      height: 80px;
      width: 80px;
      margin-top: -40px;
      background: none;
      border: none;
      line-height: 20px;
      font-size: 3rem;
      text-align: center;
    }

    .prev[disabled],
    .next[disabled] {
      opacity: 0.5;
      cursor: default;
    }

    .prev {
      left: 0;
    }

    .next {
      right: 0;
    }

    .loader {
      z-index: 1;
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -40px 0 0 -20px;
    }

    @media screen and (max-width: 34rem) {
      .prev,
      .next {
        width: 40px;
      }
    }
  </style>
</app>