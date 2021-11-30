/*body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<DocumentSnapshot>(
                future: userName.get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return const Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    return Center(
                        child: Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 30,
                            ),
                            child: Container(
                                height: 150,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            left: 10,
                                          ),
                                          child: Text(
                                            "Welcome ${data['firstName']}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Text(
                                            "Score: ${data['score']}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ))
                                    ]))));
                  }
                  return const Text("loading");
                },
              ),
              //Useful websites part
              Center(
                  child: Column(children: [
                SizedBox(
                    width: 800,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Text(
                        'Useful websites:',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )),
                SizedBox(
                    width: 800,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 30,
                      ),
                      child: InkWell(
                        child: Text(
                          "National Cyber Security Centre's website",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => launch(
                          'https://www.ncsc.gov.uk/section/advice-guidance/all-topics',
                        ),
                      ),
                    )),
                SizedBox(
                    width: 650,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 30,
                      ),
                      child: InkWell(
                        child: Text(
                          "15 Most Common used Cyber Attacks",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => launch(
                          'https://www.lepide.com/blog/the-15-most-common-types-of-cyber-attacks/',
                        ),
                      ),
                    )),
              ])),

              //Most used cyber attacks section
              Center(
                  child: SizedBox(
                      width: 650,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 30),
                        child: Text(
                          'The most used cyber attacks:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ))),
              //1st Expansion Tile
              AttackExpansionTile(
                  title: Text('Malware Attacks'),
                  backgroundColor: Color(0xFF304e60),
                  collapsedColor: Color(0xFF304e60),
                  image: 'images/ransomware.png',
                  smallImage: 'images/malware.png',
                  subtitle:
                      Text('Malware usage is up almost 800% since early 2020.'),
                  attackDefinition: Text(
                      "One of the most used type of malware is Ransomware.\n"
                      "Ransomware is a type of malware from cryptovirology that threatens to publish the victim's personal data or perpetually block access to it unless a ransom is paid."),
                  finalParagraph: Text(
                      "Ransomware is often spread through phishing emails that contain malicious attachments or through drive-by downloading. Drive-by downloading occurs when a user unknowingly visits an infected website and then malware is downloaded and installed without the user’s knowledge."
                      "Crypto ransomware, a malware variant that encrypts files, is spread through similar methods and has also been spread through social media, such as Web-based instant messaging applications."
                      " Additionally, newer methods of ransomware infection have been observed. For example, vulnerable Web servers have been exploited as an entry point to gain access to an organization’s network.")),

              //2nd Expansion Tile
              AttackExpansionTile(
                  title: Text('Phising'),
                  backgroundColor: Color(0xFF565462),
                  collapsedColor: Color(0xFF565462),
                  image: 'images/amazon.png',
                  smallImage: 'images/phishing.png',
                  subtitle: Text(
                      'Phishing attacks are the most common cause of data breaches globally and have'
                      ' been the root cause of notable instances of cybercrime in the last decade.'),
                  attackDefinition: Text(
                      'Phishing attacks attempt to steal information from users or trick them into downloading malware by'
                      'sending malicious emails or text messages (SMS) that look like real requests but are, in fact, a Scam.\n'),
                  finalParagraph: Text(
                      'It occurs when an attacker, masquerading as a trusted entity, dupes a victim into opening '
                      'an email, instant message, or text message. The recipient is then tricked into clicking a malicious link, '
                      'which can lead to the installation of malware, the freezing of the system as part of a ransomware attack '
                      'or the revealing of sensitive information.'
                      'An attack can have devastating results. For individuals, this includes unauthorized purchases, the stealing of funds, or identify theft.')),

              //3rd Expansion Tile
              AttackExpansionTile(
                  title: Text('Distributed Denial of Service Attacks'),
                  backgroundColor: Color(0xFF84693b),
                  collapsedColor: Color(0xFF84693b),
                  image: 'images/ddos.png',
                  smallImage: 'images/ddosGood.png',
                  subtitle: Text(
                      'DDoS attacks are carried out with networks of Internet-connected machines.'
                      'These networks consist of computers and other devices (such as IoT devices)which have been infected with malware, allowing them to be controlled remotely by an attacker.'),
                  attackDefinition: Text(
                      'Distributed denial of service (DDoS) attacks disrupt the traffic'
                      ' to a website, application, server, service, or network by overwhelming it with a flood of traffic from compromised computer networks'
                      ' (botnets) that prevents real users from accessing it. In 2018, GitHub experienced the largest DDoS'
                      ' attack ever when it was hit with 1.35 terabits of traffic per second and was offline for almost 20 minutes as a result.'
                      'DDoS attacks are common and increased by 50% in 2020 compared to 2019, with a large surge occurring in early 2020 during the pandemic, according to security company Kaspersky.'),
                  finalParagraph: Text(
                      'The most obvious symptom of a DDoS attack is a site or service '
                      'performance issues, further investigation is usually required. Traffic analytics tools '
                      'can help you spot some of these telltale signs of a DDoS attack:'
                      '\n 1.Suspicious amounts of traffic originating from a single IP address or IP range'
                      '\n 2.A flood of traffic from users who share a single behavioral profile, such as device type, geolocation, or web browser version'
                      '\n 3.An unexplained surge in requests to a single page or endpoint'
                      '\n 4.Odd traffic patterns such as spikes at odd hours of the day or patterns that appear to be unnatural (e.g. a spike every 10 minutes)'
                      '\n 5.There are other, more specific signs of DDoS attack that can vary depending on the type of attack.')),

              Center(
                  child: SizedBox(
                width: 650,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 30,
                  ),
                  child: Text(
                    'Want to learn more about cyber security in an interactive way?\n'
                    '\nSelect from one of these games:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )),

              Center(
                  child: SizedBox(
                      width: 650,
                      child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 00),
                          child: Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: 30,
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF7387c3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      width: 200,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 0,
                                          left: 0,
                                        ),
                                        child: InkWell(
                                          child: Image.asset(
                                            'images/game1.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                          onTap: () => launch(
                                            'https://cybergamesuk.com/cybergames',
                                          ),
                                        ),
                                      ))),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF7387c3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    width: 200,
                                    height: 100,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 0,
                                        left: 0,
                                      ),
                                      child: InkWell(
                                        child: Image.asset(
                                          'images/sophos.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                        onTap: () => launch(
                                          'https://www.sophos.com/en-us/lp/games.aspx?id=001j000000pDrtx',
                                        ),
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF7387c3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      width: 200,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 0,
                                          left: 0,
                                        ),
                                        child: InkWell(
                                          child: Image.asset(
                                            'images/livingSecurity.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                          onTap: () => launch(
                                            'https://phishing.livingsecurity.com/',
                                          ),
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ))))
            ],
          ),
        )*/
        