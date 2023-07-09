extends Node

var transition_destination

var contents = [
"\n Integers:\n S2 - The date and time the passenger scanned their boarding pass at S2 (date/time)\n Flight_ID - The identification number of the flight (not unique)\n Tot_pass - The total number of passengers\n \n Characters:\n Sch_Departure - The date and time that the flight was scheduled for departure\n Act_Departure - The date and time at which the flight actually departed\n Departure_Date - The date that the flight departed \n Departure_Time - The time that the flight departed\n Time_of_Day - The time of day that the flight departed\n Day_of_Week - The date of the week that the flight departed on \n Month - The month that the flight departed in\n Year - The year that the flight departed in",
"\n Integers/Real Numbers:\n Wait_Time - The time it takes a passenger to go from S1 to S2 \n C_Start - The number of security agents at S1 when the passenger arrives at S1 (collected in 15 second intervals) \n C0 - The number of security agents at S2 when the passenger arrives at S2 (collected in 15 seconds intervals) \n C_avg - The average number of security agents while the passenger is in the PBS queue (collected in 15 second intervals) \n Order - A unique number corresponding to the order at which the passenger was scanned at S2 \n Min - Minimum wait time \n Mean - Mean of the wait time \n Median - Median wait time \n Max - Max wait time",
"\n Characters: \n Airfield - Three letter abbreviation of the Auckland Airfield (TLA) \n BFO_Dest_City - The destination city of the flight (if a Borealian airfield, i.e. SAF, CWL, QUE, AUC, only a TLA) \n BFO_Destination_Country_Code - The destination country of the flight",
"\n L - mean number of clients in the queuing system \n Lq - mean number of clients waiting in line \n Ls - mean number of clients in service \n \n W - mean time a client spends in the system \n Wq - mean time a client spends in line \n Ws - mean time a client spends in service \n \n Throughput - rate at which customers are successfully served or processed by the servers",
"\n", "\n", "\n", "\n"]

var fun_facts_AUC = [
"Fun Fact:\nDid you know that a whopping 165,000 adventure-seekers took off on domestic flights bound for the marvelous country of Borealia, making it the hottest travel destination at the Auckland airfield? The runner-up, Vespuchia, had just a quarter of Borealia's flights, yet it still managed to attract a significant number of travelers with its irresistible charm.\n",
"Fun Fact:\nQueenston emerged as the most popular city destination traveling from Auckland, with  the highest number of destined flights identified by the city codes QUE or BORQUE. Aswell, a significant number of international flights were dedicated to Vespuchia and Scotland.\n",
"Fun Fact:\nThursdays dominate any given week at the Auckland Airfield for jet setters, with a staggering 36,000 departures. Whereas Mondays take a more tranquil approach, with a modest 23,600 flights.\n",
"Fun Fact:\nThe Auckland airport is at its liveliest at 8 AM, with travelers taking off to various destinations. The excitement continues to surge at 7 PM and 8 PM. In contrast, the airport finds serenity during the early hours from 1 AM to 6 AM.\n",
"Fun Fact:\nExpect to be scanned at 7 AM, as this is the most frequent time for S2 scans. This aligns with the typical departure time being an hour after they get through security. Interestingly, between 11 PM and 5 AM, there were no scans recorded at S2, suggesting a quieter period when the airport slumbered peacefully.\n",
"Fun Fact:\nDid you know the number of agents might not always determine how long you'll wait? Most wait times stays below 40 minutes, regardless of whether there were 3 security agents or just 1. A few travelers also faced longer waits with fewer agents, but this wasn't the norm.\n",
"Fun Fact:\nDon’t expect to wait that long at the Auckland airfield! The majority of the wait times were under 30 minutes, where most passengers experienced a quick passage through the queues with a mode of 2.5 minutes.\n"]

var fun_facts_SAF = [
"Fun Fact:\nOver 1,700 flights landed in Vespuchia from the Saint Francois airfield, the country with the highest number of destined flights from SAF. There were almost double the amount of international flights than domestic flights out of this airfield.\n",
"Fun Fact:\nThe two highest destined cities from flights that departed from SAF were in Vespuchia and made up over 53% of departures.\n",
"Fun Fact:\nSundays were the busiest travel days for SAF and Tuesdays were the least busy travel days - if you’re looking to travel, we recommend traveling on Tuesdays for shorter lines and less crowded areas.\n",
"Fun Fact:\nThe most flights departed the airfield at 10 AM and 12 PM, and the least flights departed 1 and 9 AM.\n",
"Fun Fact:\nIf you’re looking for shorter lines at security, we recommend visiting between 6 PM and 4 AM as there were no reported S2 scans during that time period at SAF.\n",
"Fun Fact:\nOn average, the more security agents at S2, the lower the time you’ll have to wait in line.\n",
"Fun Fact:\nThe majority of passengers waited less than 16 minutes in line between S1 and S2 at the SAF airfield.\n"
]

var fun_facts_CWL = [
"Fun Fact:\nDid you know that there were only two years that flights were destined for the Chebucto airfield? All flights destined for Chebucto in 2030 left from the Saint Francois airfield and all flights destined for Chebucto in 2028 left from the Auckland airfield.\n"
]

var fun_facts_QUE = [
"Fun Fact:\nThere were 7 flights that departed from the Queenston airport, of which all but 1 had S2 times occurring after the departure times.\n",
"Fun Fact:\nOf the 7 flights, 6 of them were destined for Borealia and 1 of them was destined for Greece.\n",
"Fun Fact:\nThe 6 Borealia-destined flights all took off in December of 2026, possibly indicating that the Queenston airfield could be a holiday airfield for that year.\n",
"Fun Fact:\nOnly 1 of the 7 flights departed on a weekend, the rest leaving the airfield on a weekday with the most common being Tuesday or Wednesday.\n",
"Fun Fact:\nDid you know that there were over 100,000 passengers that landed in the Queenston airfield in 2028 and 2030 combined? And of those 100,000 only 379 of them occurred in 2030.\n"
]
