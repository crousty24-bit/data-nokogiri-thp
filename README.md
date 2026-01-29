# Data Scrapping with Nokogiri

A Ruby web scraping project that extracts and collects data from various public sources using Nokogiri. This project includes tools for scraping cryptocurrency market data, municipal government emails, and parliamentary deputy contact information.

## Overview

This project demonstrates web scraping techniques using the Nokogiri HTML parser to extract structured data from multiple public websites. It provides modular scripts for collecting specific datasets from government and financial sources.

## Features

- **Cryptocurrency Market Data**: Scrapes cryptocurrency names and prices from CoinMarketCap
- **Municipal Townhall Emails**: Extracts email addresses for French municipal townhalls from the official government directory
- **Parliamentary Deputies Data**: Collects contact information for members of the French National Assembly

## Requirements

- Ruby 3.4.2
- Bundler

## Dependencies

- **nokogiri**: HTML and XML parser
- **rspec**: Testing framework
- **pry**: Interactive debugger
- **rubocop**: Code quality analyzer

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd data-nokogiri-thp
```

2. Install Ruby dependencies:
```bash
bundle install
```

## Usage

### Cryptocurrency Data Scraper

Extracts current cryptocurrency names and prices from CoinMarketCap:

```bash
ruby lib/data_cryptocurrencies.rb
```

Note: This scraper retrieves data from static HTML content. For dynamic content loaded by JavaScript, consider using the Watir gem instead of Nokogiri.

### Municipal Townhall Emails

Collects contact email addresses for townhalls in Île-de-France, Val-d'Oise region:

```bash
ruby lib/data_emails.rb
```

### Parliamentary Deputies Data

Scrapes contact information for members of the French National Assembly:

```bash
ruby lib/data_emails_deputy.rb
```

## Testing

Run the test suite:

```bash
bundle exec rspec
```

Test files are located in the `spec/` directory:
- `data_cryptocurrencies_scrapp_spec.rb`
- `data_emails_scrapp_spec.rb`
- `data_emails_deputy_scrapp_spec.rb`

## Code Quality

Analyze code quality with Rubocop:

```bash
bundle exec rubocop
```

## Project Structure

```
├── Gemfile                              # Gem dependencies
├── README.md                            # Project documentation
├── lib/
│   ├── data_cryptocurrencies.rb        # Cryptocurrency market data scraper
│   ├── data_emails.rb                  # Townhall emails scraper
│   └── data_emails_deputy.rb           # Parliamentary deputies data scraper
└── spec/
    ├── spec_helper.rb                  # Test configuration
    ├── data_cryptocurrencies_scrapp_spec.rb
    ├── data_emails_scrapp_spec.rb
    └── data_emails_deputy_scrapp_spec.rb
```

## Technical Considerations

- **Static vs Dynamic Content**: Nokogiri parses static HTML. For websites with JavaScript-rendered content, consider using Watir or Selenium instead.
- **Data Limitations**: Current scrapers have inherent limitations based on the websites' structure and content loading mechanisms.
- **Ethical Scraping**: Ensure compliance with website terms of service and robots.txt before running scrapers in production.
