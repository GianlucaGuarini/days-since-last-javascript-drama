<timer>
  <time>
    { days }
  </time>
  <h1><a href={opts.link}> { opts.title }</a></h1>
  <small>Timer to track how many days passed since the latest Javascript drama</small>
  <script>
    setDiff() {
      const timeDiff = Math.abs(new Date().getTime() - opts.date.getTime())
      this.days = Math.ceil(timeDiff / (1000 * 3600 * 24))
    }

    this.on('before-mount', this.setDiff).on('update', this.setDiff)
  </script>
  <style>
    :scope {
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      width: 100%;
      background: #fff9fa;
      padding: 2rem 4rem;
      box-sizing: border-box;
    }

    time {
      font-size: 20rem;
      font-weight: bold;
    }

    small {
      text-align: center;
      display: inline-block;
    }

    a {
      color: #81505d;
    }

    h1 {
      text-align: center;
      font-family: Georgia;
      font-weight: normal;
      font-style:oblique;
    }

    @media screen and (max-width: 34rem) {
      time {
        font-size: 14rem;
      }
    }
  </style>
</timer>