{smcl}
{* *! version 0.0.0.9000  25may2017}{...}
{title:Title}

{phang}
{bf:wid} {hline 2} Download data from WID.world

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:wid}
[{cmd:,} {it:options}]

{synoptset 50 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt ind:icators(list of 6-letter codes|_all)}}codes names of the indicators in the database; default is {it:_all} for all indicators; see {help wid##options:options} for details{p_end}
{synopt:{opt ar:eas(list of area codes|_all)}}area code names of the database; {it:XX} for country/regions, {it:XX-YY} for subregions; default is {it:_all} for all areas; see {help wid##options:options} for details{p_end}
{synopt:{opth y:ears(numlist)}}years; default is all{p_end}
{synopt:{opt p:erc(list of percentiles|_all)}}list of percentiles; either {it:pXXpYY} or {it:pXX}; default is {it:all_} for all percentiles; see {help wid##options:options} for details{p_end}
{synopt:{opt ag:es(list of age codes|_all)}}age category codes in the database; {it:999} for all ages, {it:992} for adults; default is {it:_all} for all age categories; see {help wid##options:options} for more{p_end}
{synopt:{opt pop:ulation(list of population codes|_all)}}type of population; one-letter code, {it:t} for tax units, {it:i} for individuals; default is {it:_all} for all population types; see {help wid##options:options} for more{p_end}
{synopt:{opt meta:data}}retrieve metadata (ie. variable descriptions, sources, methodological notes, etc.){p_end}
{synopt:{opt clear}}replace data in memory{p_end}
{synoptline}

{marker description}{...}
{title:Description}

{pstd}
{cmd:wid} imports data from the World Wealth and Income Database (WID.world) directly into Stata.

{marker options}{...}
{title:Options}

{phang}
{opt ind:icators(list of 6-letter codes|_all)} specify indicators to retrieve. Default is {it:_all} for all indicators.
Indicators are 6-letter codes that correspond to a given series type for a given income or wealth concept.
The first letter correspond to the type of series.
Some of the most common possibilities include:

{p2colset 15 36 38 16}{...}
{p2col :{bf:one-letter code}}{bf:description}{p_end}
{p2line}
{p2col :a}average{p_end}
{p2col :s}share{p_end}
{p2col :t}threshold{p_end}
{p2col :m}macroeconomic total{p_end}
{p2col :w}wealth/income ratio{p_end}
{p2line}
{space 14}See {help wid_list_series_types:list of series types} for the complete list.
{p2colreset}{...}

{p 8 8}The next five letters correspond a concept (usually of income and wealth). Some of the most common possibilities include:{p_end}

{p2colset 15 36 38 16}{...}
{p2col :{bf:five-letter code}}{bf:description}{p_end}
{p2line}
{p2col :ptinc}pre-tax national income{p_end}
{p2col :pllin}pre-tax labor income{p_end}
{p2col :pkkin}pre-tax capital income{p_end}
{p2col :fiinc}fiscal income{p_end}
{p2col :hweal}net personal wealth{p_end}
{p2line}
{space 14}See {help wid_list_concepts:list of concepts} for the complete list.
{p2colreset}{...}

{p 8 8}For example, {it:sfiinc} correspond to the share of fiscal income, {it:ahweal} correspond to average personal wealth.{p_end}

{phang}
{opt ar:eas(list of area codes|_all)} specify areas for which to retrieve data. Default is {it:_all} for all areas.
Countries and world regions are coded using 2-letter ISO codes.
Country subregions are coded as {it:XX-YY} where {it:XX} is the country 2-letter code.
See {help wid_list_area_codes:list of area codes} for the complete list of area codes.

{phang}
{opth y:ears(numlist)} specify years for which to retrieve data. Default is all years.

{phang}
{opt p:erc(list of percentiles|_all)} specify which percentiles of the distribution to retrieve.
For share and average variables, percentiles correspond to percentile ranges and take the form {it:pXXpYY}.
For example the top 1% share correspond to {it:p99p100}. The top 10‰ share excluding the top 1% is {it:p90p99}.
For thresholds, percentiles are just {it:pXX}. For example, the 90% quantile is {it:p90}. Variables with no distributional meaning use the percentile {it:p0p100}.

{phang}
{opt ag:es(list of age codes|_all)} specify which age categories to retrieve.
Ages are coded using 3-digit codes.
Some of the most common possibilities include:

{p2colset 15 36 38 16}{...}
{p2col :{bf:3-digit code}}{bf:description}{p_end}
{p2line}
{p2col :999}all ages{p_end}
{p2col :992}adults, including elderly (20+){p_end}
{p2col :996}adults, excluding elderly (20-65){p_end}
{p2line}
{space 14}See {help wid_list_age_codes:list of age codes} for the complete list.
{p2colreset}{...}

{phang}
{opt pop:ulation(list of population codes|_all)} specify which population categories to retrieve.
Population categories are coded using one-letter codes.
Some of the most common possibilities include:

{p2colset 15 36 38 16}{...}
{p2col :{bf:one-letter code}}{bf:description}{p_end}
{p2line}
{p2col :i}individuals{p_end}
{p2col :t}tax units (20+){p_end}
{p2col :j}equal-split adults (ie. income or wealth divided equally among spouses){p_end}
{p2line}
{space 14}See {help wid_list_population_codes:list of population codes} for the complete list.
{p2colreset}{...}

{phang}
{opt metadata} also retrieve metadata. Metadata provide, for each observation, the name and short description of the variable, of the age category, of the population category, the source of the data, and methodological notes.

{phang}
{opt clear} replace data in memory, if any; if dataset is not empty and that option is not specified, the command will refuse to execute to avoid data losses.

{marker remarks}{...}
{title:Remarks}

{pstd}
Data is presented in long format (one observation per value).
All monetary amounts are in constant 2015 local currency.
You can access the price index using the indicator {it:inyixx}, the PPP exchange rates using {it:xlcusp} (USD), {it:xlceup} (EUR), {it:xlcyup} (CNY), and the market exchange rates using {it:xlcusx} (USD), {it:xlceux} (EUR), {it:xlcyux} (CNY).

{pstd}
Just typing {cmd: wid, clear} will download the entire database, which may takes a very long time. We recommend the indicators you want to download in advance.

{marker examples}{...}
{title:Examples}

{pstd}
Plot wealth inequality share in France:

        {cmd:wid, indicators(shweal) areas(FR) perc(p90p100 p99p100) ages(992) pop(j) clear}
    
        {cmd:// Reshape and plot}
        {cmd:reshape wide value, i(year) j(percentile) string}
        {cmd:label variable valuep90p100 "Top 10% share"}
        {cmd:label variable valuep99p100 "Top 1% share"}
        
        {cmd:graph twoway line value* year, title("Wealth inequality in France") ///}
        {cmd:    ylabel(0.2 "20%" 0.4 "40%" 0.6 "60%" 0.8 "80%") ///}
        {cmd:    subtitle("equal-spit adults") ///}
        {cmd:    note("Source: WID.world")}
        
        {it:({stata wid_example1:click to run})}

{pstd}
Plot the evolution of the pre-tax national income of the bottom 50% of the population in China, France and the United States since 1978 (in log scale):

        {cmd:// Download and store the 2015 USD PPP exchange rate}
        {cmd:wid, indicators(xlcusp) areas(FR US CN) year(2015) clear}
        {cmd:rename value ppp}
        {cmd:tempfile ppp}
        {cmd:save "`ppp'"}
        
        {cmd:wid, indicators(aptinc) areas(FR US CN) perc(p0p50) year(1978/2015) ages(992) pop(j) clear}
        {cmd:merge n:1 country using "`ppp'", nogenerate}
        
        {cmd:// Convert to 2015 USD PPP (thousands)}
        {cmd:replace value = value/ppp/1000}
        
        {cmd:// Reshape and plot}
        {cmd:keep country year value}
        {cmd:reshape wide value, i(year) j(country) string}
        {cmd:label variable valueFR "France"}
        {cmd:label variable valueUS "United States"}
        {cmd:label variable valueCN "China"}
        
        {cmd:graph twoway line value* year, yscale(log) ylabel(1 2 5 10 20) ///}
        {cmd:    ytitle("2015 PPP USD (000’s)") ///}
        {cmd:    title("Average pre-tax national income of the bottom 50%") subtitle("equal-split adults") ///}
        {cmd:    note("Source: WID.world") legend(rows(1))}
        
        {it:({stata wid_example2:click to run})}

{pstd}
Plot the long-run evolution of average net national income per adult in France, Germany, the United Kingdom and the United States (in log scale):

        {cmd:// Download and store the 2015 USD PPP exchange rate}
        {cmd:wid, indicators(xlcusp) areas(FR US DE GB) year(2015) clear}
        {cmd:rename value ppp}
        {cmd:tempfile ppp}
        {cmd:save "`ppp'"}
        
        {cmd:// Download net national income in constant 2015 local currency}
        {cmd:wid, indicators(anninc) areas(FR US DE GB) age(992) clear}
        {cmd:merge n:1 country using "`ppp'", nogenerate}
        
        {cmd:// Convert to 2015 USD PPP (thousands)}
        {cmd:replace value = value/ppp/1000}
        
        {cmd:// Reshape and plot}
        {cmd:keep country year value}
        {cmd:reshape wide value, i(year) j(country) string}
        {cmd:label variable valueFR "France"}
        {cmd:label variable valueUS "United States"}
        {cmd:label variable valueDE "Germany"}
        {cmd:label variable valueGB "United Kingdom"}
        
        {cmd:graph twoway line value* year, yscale(log) ///}
        {cmd:    ytitle("2015 PPP USD (000’s)") ylabel(2 5 10 20 50 100) ///}
        {cmd:    title("Average net national income") subtitle("per adult") ///}
        {cmd:    note("Source: WID.world")}

        {it:({stata wid_example3:click to run})}

{title:Contact}

{pstd}
If you have comments, suggestions, or experience any problem with this command, please contact <thomas.blanchet@wid.world>.

