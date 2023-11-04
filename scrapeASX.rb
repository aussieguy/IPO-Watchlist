# Purpose - To scrape the ASX IPO web page and obtain the list of IPOs.
# Each record is then written to the Listing table.
# Begin with the database table empty as we are only writing the current IPOs to the table.
# Listed companies aren't kept in this table, only those that are going to IPO.

Listing.delete_all      #Ensures the db is empty to begin with

# Fetch the web page so we can scrape it
doc = Nokogiri::HTML(URI.open("https://www.asx.com.au/listings/upcoming-floats-and-listings"))

# How many companies are there?
companyCount = doc.css("h6").count

# Squish removes all newlines and excess whitespace.  Add a line break for each new listing then convert to an array.
allCompanyDetails = (doc.css('.table-container').text).squish!.gsub!("Listing","\nListing").split("\n") 
allCompanyDetails.delete_at(0)    #Delete first element as this is blank

loopCounter = 0
while loopCounter < companyCount
  @listing = Listing.new    #Create parameters for new company.

#Fetch listing date.
  listingDateEndPosition = (allCompanyDetails[loopCounter].index('Company contact')).to_i
  listingDateStartPosition = 12
  listingDateRange = listingDateEndPosition - listingDateStartPosition
  listingDate = allCompanyDetails[loopCounter].slice(listingDateStartPosition,listingDateRange).gsub("#","")
  if listingDate == ""
    listingDate = "TBA"
  end
  @listing.listingDate = listingDate

#Fetch company name.   
  allCompanies = (doc.css('.gtm-accordion').text.gsub!("-","\n").split("\n"))
  company = allCompanies[loopCounter]  
  #We could have TBACompany or #Company or ##Company
  if company.count("#") == 1
    hashPosition = company.index("#").to_i
    company = company.slice(hashPosition + 1,company.length)
  end
  if company.count("##") == 2
    hashPosition = company.index("##").to_i
    company = company.slice(hashPosition + 2,company.length)
  end
  tbaPosition = company.index("TBA")
  if tbaPosition == 1     #We only want what is after a TBA.
    company = company.slice(4,company.length)
  end
  @listing.company = company

#Fetch Company contact
  contactStartPosition = 35 + listingDateRange
  contactEndPosition = ((allCompanyDetails[loopCounter].index('Principal')).to_i) - 1                  
  contactRange = contactEndPosition - contactStartPosition
  contact = allCompanyDetails[loopCounter].slice(contactStartPosition,contactRange)
  @listing.contact = contact

  #Fetch activity
  activityStartPosition = contactEndPosition + 21
  activityEndPosition = (allCompanyDetails[loopCounter].index('Issue')).to_i
  activityRange = activityEndPosition - activityStartPosition
  activity = allCompanyDetails[loopCounter].slice(activityStartPosition,activityRange)
  @listing.activities = activity

  #Fetch price
  priceStartPosition = (allCompanyDetails[loopCounter].index('Issue Price').to_i) + 11
  priceEndPosition = (allCompanyDetails[loopCounter].index('Issue Type').to_i)
  priceRange = priceEndPosition - priceStartPosition
  price = allCompanyDetails[loopCounter].slice(priceStartPosition,priceRange)
  @listing.price = price

  #Fetch shareType
  typeStartPosition = (allCompanyDetails[loopCounter].index('Issue Type').to_i) + 10
  typeEndPosition = (allCompanyDetails[loopCounter].index('Security').to_i)
  typeRange = typeEndPosition - typeStartPosition
  shareType = allCompanyDetails[loopCounter].slice(typeStartPosition,typeRange)
  @listing.shareType = shareType

  #Fetch code
  codeStartPosition = (allCompanyDetails[loopCounter].index('Security').to_i) + 13
  codeEndPosition = (allCompanyDetails[loopCounter].index('Capital').to_i)
  codeRange = codeEndPosition - codeStartPosition
  code = allCompanyDetails[loopCounter].slice(codeStartPosition,codeRange)
  @listing.code = code

  #Fetch captial
  capitalStartPosition = (allCompanyDetails[loopCounter].index('Capital').to_i) + 20
  capitalEndPosition = (allCompanyDetails[loopCounter].index('Expected').to_i)
  capitalRange = capitalEndPosition - capitalStartPosition
  capital = allCompanyDetails[loopCounter].slice(capitalStartPosition,capitalRange)
  @listing.capital = capital

  #Fetch close
  closeStartPosition = (allCompanyDetails[loopCounter].index('Expected').to_i) + 25
  closeEndPosition = (allCompanyDetails[loopCounter].index('Underwriter').to_i)
  closeRange = closeEndPosition - closeStartPosition
  close = allCompanyDetails[loopCounter].slice(closeStartPosition,closeRange)
  @listing.close = close

  #Fetch underwriter
  underwriterStartPosition = (allCompanyDetails[loopCounter].index('Underwriter').to_i) + 11
  underwriterEndPosition = allCompanyDetails[loopCounter].length
  underwriterRange = underwriterEndPosition - underwriterStartPosition
  underwriter = allCompanyDetails[loopCounter].slice(underwriterStartPosition,underwriterRange)
  @listing.underwriter = underwriter

  loopCounter += 1    

# Save the record we have now created.  There will be no duplicates because db is blank to begin with.
  @listing.save

end
