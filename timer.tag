<timer>
  <time>{days}</time>
  <h1><a href={opts.link}>{opts.title}</a></h1>
  <date>{date.toLocaleDateString()}</date>
  <small>Timer to track how many days passed since the latest Javascript drama</small>
  <script>
    this.date = null
    setDiff() {
      this.date = new Date(opts.date)
      const timeDiff = Math.abs(new Date().getTime() - this.date.getTime())
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
      padding: 2rem;
      box-sizing: border-box;
    }

    date {
      color: #999;
      font-family: Georgia;
      font-style: oblique;
      margin: 0 0 1rem;
    }

    time {
      color: #333;
      font-size: 20rem;
      font-weight: bold;
    }

    small {
      color: #666;
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