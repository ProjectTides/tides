# Project Tides

Tides is a two-way chat platform between NGOs and their impact community that is built using WhatsApp API. The platform allows NGOs to chat with each of their beneficiaries and help them to uplift their lives. NGOs can work in various sectors such as healthcare, education, women empowerment, and more… so for education, an NGO can chat with a beneficiary to help them with the admission process, share study material or learn other ways they can intervene.

## About the prototype
This prototype repository covers the various technologies, connect the dots and test a working model of the platform. A most basic use case of the application is used to build the prototype. It follows like this:
1. A beneficiary will be able to message an NGO user via WhatsApp.
2. The message will be visible on the platform.
3. It will get labeled with relevant keywords.
4. A basic response will be suggested too.
5. The NPO user will use the suggestion from the system to form a response and then send it to the beneficiary.

## Status
![CI](https://img.shields.io/github/workflow/status/ProjectTides/tides/CI?label=CI&logo=github&style=flat-square)
![License](https://img.shields.io/github/license/ProjectTides/tides?style=flat-square)

## Installation

### Prerequisite:
1. Elixir 1.6 or later
2. Erlang 20 or later
3. Phoenix

### Setup Guide
1. Run `mix phx.gen.secret` to generate secret and add it to env variable `SECRET_KEY_BASE`

2. Database setup
    1. Dockerized project setup
        * `docker-compose config` Check if docker config and env variables are set properly.
        * `docker-compose up -d` Start the container.
    2. Non-dockerized project setup
        * Create your application database manually.

3. Duplicate the file `dev.exs.example` and name it as `dev.exs`.
4. Run `mix setup`.
5. Run `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Documentation
ProjectTides's documentation is built with [Jekyll](https://jekyllrb.com/) and publicly hosted on GitHub Pages at <https://projecttides.github.io/tides/>.

## Resources

1. **Elixir**
    1. [Elixir basics](https://elixir-lang.org/getting-started/introduction.html)
2. **CI**
    1. [Phoenix github action for CI](https://phxroad.com/devops/github-actions-for-phoenix)
3. **CD**
    1. [Dockerized production env](https://medium.com/@j.schlacher_32979/release-a-phoenix-application-with-docker-and-postgres-28c6ae8c7184)
    2. [Deploying Docker Containers Using an AWS CodePipeline](https://www.infoq.com/articles/aws-codepipeline-deploy-docker/)

## Contributing

We appreciate feedback and contribution to this repo! Before you get started, please see the following:

- [ProjectTides's general contribution guidelines](https://projecttides.github.io/tides/getting-started/general-contributing)
- [This repo's contribution guide](https://projecttides.github.io/tides/getting-started/contributing)
- [ProjectTides's code of conduct guidelines](https://projecttides.github.io/tides/about/code-of-conduct)

## Support + Feedback

Include information on how to get support. Consider adding:

- Use [Issues](https://github.com/ProjectTides/Tides/issues) for code-level support
- Join [Project Tides Discord Server](https://discord.gg/6dKGwwU) for more usage, questions, specific cases with the community.
- Email us at opensource@coloredcow.com for more support and feedbacks.

## License

This project is covered under [The GNU General Public License v3.0](LICENSE).
