# Project Tides

Tides is a two-way chat platform between NGOs and their impact community that is built using WhatsApp API. The platform allows NGOs to chat with each of their beneficiaries and help them to uplift their lives. NGOs can work in various sectors such as healthcare, education, women empowerment, and more… so for education, an NGO can chat with a beneficiary to help them with the admission process, share study material or learn other ways they can intervene.

## About the prototype
This prototype repository covers the various technologies, connect the dots and test a working model of the platform. A most basic use case of the application is used to build the prototype. It follows like this:
1. A beneficiary will be able to message an NGO user via WhatsApp.
2. The message will be visible on the platform.
3. It will get labeled with relevant keywords.
4. A basic response will be suggested too.
5. The NPO user will use the suggestion from the system to form a response and then send it to the beneficiary.

![CI](https://img.shields.io/github/workflow/status/ProjectTides/tides/CI?label=CI&logo=github&style=flat-square)
[![License](https://img.shields.io/github/license/ProjectTides/tides?style=flat-square)](#License)

## Table of Contents

- [Project Tides](#project-tides)
	- [About the prototype](#about-the-prototype)
	- [Table of Contents](#table-of-contents)
	- [Installation](#installation)
	- [Contributing](#contributing)
	- [Support + Feedback](#support--feedback)
	- [License](#license)

## Installation

1. Duplicate `.env.example` and named it as `.env`.
2. Add the env variables. Few variables are docker specific and can be skipped.
    1. [POSTGRES_MULTIPLE_DATABASES, POSTGRES_ROLE]
3. Run `mix phx.gen.secret` to generate secret and add it to env variable `SECRET_KEY_BASE`

4. Database setup
    1. Dockerized project setup
        * `docker-compose config` Check if docker config and env variables are set properly. 
        * `docker-compose up -d` Start the container.
    2. Non-dockerized project setup
        * Create your application database manually.

5. Duplicate `dev.exs.example` and name it as `dev.exs`.
6. Run `mix setup`.
7. Run `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Contributing

We appreciate feedback and contribution to this repo! Before you get started, please see the following:

- [ProjectTides's general contribution guidelines](GENERAL-CONTRIBUTING.md)
- [ProjectTides's code of conduct guidelines](CODE-OF-CONDUCT.md)
- [This repo's contribution guide](CONTRIBUTING.md)

## Support + Feedback

Include information on how to get support. Consider adding:

- Use [Issues](https://github.com/ProjectTides/Tides/issues) for code-level support
- Join [Project Tides Discord Server](https://discord.gg/6dKGwwU) for more usage, questions, specific cases with the community.
- Email us at opensource@coloredcow.com for more support and feedbacks.

## License

This project is covered under [The GNU General Public License v3.0](LICENSE).
