<timer>
  <time>{days}</time>
  <h1><a href={opts.link}>{opts.title}</a></h1>
  <date>{date.toLocaleDateString()}</date>
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
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      width: 100%;
      padding: 2rem;
      box-sizing: border-box;
    }

    date {
      margin: 0 0 1rem;
    }

    time {
      display: inline-block;
      color: #333;
      font-weight: bold;
      font-size: 20rem;
    }

    h1 {
      margin: 0 0 2rem;
      text-align: center;
    }

    @media screen and (max-width: 34rem) {
      time {
        font-size: 14rem;
      }
    }
  </style>
</timer>