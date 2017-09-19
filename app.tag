<app>
  <fork/>
  <section
    class='timer'
    if={!isLoading && event}
    data-is='animore'
    mount={{
      scale: [0, 1]
    }}>
    <timer
      date={event.date}
      title={event.title}
      link={event.link}
      />
  </section>
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
  <section class='old-dramas' if={dramas}>
    <h2>Older dramas</h2>
    <ul>
      <li
        data-is='animore'
        each={drama, i in dramas}
        mount={{
          delay: i * 100,
          translateX: [-100, 0],
        }}
        if={i !== 0}
      >
        <h3><a href={drama.link}>{drama.title}</a></h3><date>{new Date(drama.date).toLocaleDateString()}</date>
      </li>
    </ul>
  </section>
  <script>
    load() {
      fetch('./dramas.json?8')
        .then(data => data.json())
        .then(this.ready)
    }

    ready(dramas) {
      this.dramas = dramas
      this.isLoading = false
      this.event = this.dramas[0]
      this.update()
    }

    this.dramas = null
    this.event = null
    this.isLoading = true

    setTimeout(this.load, 1000)
  </script>
  <style>
    :scope {
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: center;
      width: 100%;
    }

    a {
      color: #81505d;
      font-family: Georgia;
      font-weight: normal;
    }

    date {
      color: #333;
      font-family: Georgia;
      font-style: oblique;
    }

    .timer {
      flex: 0 0 100%;
      display: flex;
      min-height: 90vh;
    }

    .loader {
      z-index: 1;
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -40px 0 0 -20px;
    }

    .old-dramas {
      flex: 0 1 100%;
      max-width: 520px;
      padding: 0 2rem;
    }

    .old-dramas h2 {
      margin: 0;
    }

    .old-dramas > ul {
      display: flex;
      flex-direction: column;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .old-dramas > ul > li {
      display: flex;
      margin: 0;
      align-items: center;
      justify-content: space-between;
    }

    .old-dramas > ul > li > h3 {
      margin-right: 0.8rem;
    }
  </style>
</app>