#!/usr/bin/env deno run --allow-net
// Converts a currency using DuckDuckGo API

const endpoint = "https://duckduckgo.com/js/spice/currency";

function formatOutput(responseJson: any): string {
    const conversion = responseJson.conversion;
    return `Date: ${conversion["rate-utc-timestamp"]}
Conversion-Rate: ${conversion["conversion-rate"]}
Conversion: ${conversion["from-amount"]} ${conversion["from-currency-symbol"]} = ${conversion["converted-amount"]} ${conversion["to-currency-symbol"]}`;
}

function removeJsonpPadding(paddedText: string): string {
    return paddedText
        // JS regexp works on a line-by-line basis; join all lines
        .replace(/\n/g, ' ')
        .replace(/[_a-z]*\((.*)\);/, '$1');
}

function urlToConvert(fromCurrency: string,
                      toCurrency: string,
                      amount: number): string {
    return `${endpoint}/${amount}/${fromCurrency}/${toCurrency}`;
}

//////////////////////////////////////////////////////////////////////

if (Deno.args.length < 3) {
    console.log("Usage: currency.ts <from currency> <to currency> <amount>");
    console.log("Example: deno run currency.js usd rub 20");
    Deno.exit(1);
}

const [fromCurrency, toCurrency, amountString] = Deno.args;

const amount = Number(amountString);

if (Number.isNaN(amount)) {
    console.log(`Error: not a valid number: ${amountString}`);
    Deno.exit(2);
}

const url = urlToConvert(fromCurrency, toCurrency, amount);
console.log(`Source: ${url}`);

const response = await fetch(url);
const rawResponseText = await response.text();
const responseText = removeJsonpPadding(rawResponseText);
const responseJson = JSON.parse(responseText);
console.log(formatOutput(responseJson));
