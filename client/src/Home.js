import React, { Component } from 'react'
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'

class Home extends Component {
  constructor () {
    super()
    this.state = {}
    this.getClients = this.getClients.bind(this)
    this.getClient = this.getClient.bind(this)
  }

  componentDidMount () {
    this.getClients()
  }

  fetch (endpoint) {
    return window.fetch(endpoint)
      .then(response => response.json())
      .catch(error => console.log(error))
  }

  getClients () {
    this.fetch('/api/clients')
      .then(clients => {
        if (clients.length) {
          this.setState({clients: clients})
          this.getClient(clients[0].id)
        } else {
          this.setState({clients: []})
        }
      })
  }

  getClient (id) {
    this.fetch(`/api/clients/${id}`)
      .then(client => this.setState({client: client}))
  }

  render () {
    let {clients, client} = this.state
    return clients
      ? <Container text>
        <Header as='h2' icon textAlign='center' color='teal'>
          <Icon name='unordered list' circular />
          <Header.Content>
            List of Jobs
          </Header.Content>
        </Header>
        <Divider hidden section />
        {clients && clients.length
          ? <Button.Group color='teal' fluid widths={clients.length}>
            {Object.keys(clients).map((key) => {
              return <Button active={client && client.id === clients[key].id} fluid key={key} onClick={() => this.getClient(clients[key].id)}>
                {clients[key].title}
              </Button>
            })}
          </Button.Group>
          : <Container textAlign='center'>No clients found.</Container>
        }
        <Divider section />
        {client &&
          <Container>
            <Header as='h2'>{client.last_name}</Header>
            {client.tax_id && <p>{client.tax_id}</p>}
            {client.jobss &&
              <Segment.Group>
                {client.jobs.map((job, i) => <Segment key={i}>{job.status}</Segment>)}
              </Segment.Group>
            }
            {client.steps && <p>{client.steps}</p>}
            {client.source && <Button basic size='tiny' color='teal' href={client.source}>Source</Button>}
          </Container>
        }
      </Container>
      : <Container text>
        <Dimmer active inverted>
          <Loader content='Loading' />
        </Dimmer>
      </Container>
  }
}

export default Home