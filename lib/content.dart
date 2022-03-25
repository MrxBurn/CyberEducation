// ignore_for_file: non_constant_identifier_names

//This file is used to add the data on each of the sections located on the home page
//Classes have been created for each section of the home page

class AttacksContent {
  //Malware
  static String malware_AD =
      "One of the most used type of malware is Ransomware. Ransomware is a type of malware from cryptovirology that threatens to publish the victim's personal data or perpetually block access to it unless a ransom is paid.\n";
  static String malware_P =
      "\nRansomware is often spread through phishing emails that contain malicious attachments or through drive-by downloading. Drive-by downloading occurs when a user unknowingly visits an infected website and then malware is downloaded and installed without the user’s knowledge. Crypto ransomware, a malware variant that encrypts files, is spread through similar methods and has also been spread through social media, such as Web-based instant messaging applications. Additionally, newer methods of ransomware infection have been observed. For example, vulnerable Web servers have been exploited as an entry point to gain access to an organization’s network.";

  static String malware_S =
      'Malware usage is up almost 800% since early 2020.\n';

  //Phishing
  static String phishing_AD =
      'Phishing attacks attempt to steal information from users or trick them into downloading malware by'
      'sending malicious emails or text messages (SMS) that look like real requests but are, in fact, a Scam.\n';

  static String phishing_P =
      '\nIt occurs when an attacker, masquerading as a trusted entity, dupes a victim into opening '
      'an email, instant message, or text message. The recipient is then tricked into clicking a malicious link, '
      'which can lead to the installation of malware, the freezing of the system as part of a ransomware attack '
      'or the revealing of sensitive information.'
      'An attack can have devastating results. For individuals, this includes unauthorized purchases, the stealing of funds, or identify theft.';
  static String phishing_S =
      'Phishing attacks are the most common cause of data breaches globally and have'
      ' been the root cause of notable instances of cybercrime in the last decade.\n';

  //DDOS

  static String ddos_AD =
      '\nDistributed denial of service (DDoS) attacks disrupt the traffic'
      'to a website, application, server, service, or network by overwhelming it with a flood of traffic from compromised computer networks'
      '(botnets) that prevents real users from accessing it. In 2018, GitHub experienced the largest DDoS'
      'attack ever when it was hit with 1.35 terabits of traffic per second and was offline for almost 20 minutes as a result.'
      'DDoS attacks are common and increased by 50% in 2020 compared to 2019, with a large surge occurring in early 2020 during the pandemic, according to security company Kaspersky.\n';
  static String ddos_P =
      '\nThe most obvious symptom of a DDoS attack is a site or service '
      'performance issues, further investigation is usually required. Traffic analytics tools '
      'can help you spot some of these telltale signs of a DDoS attack:'
      '\n 1. Suspicious amounts of traffic originating from a single IP address or IP range'
      '\n 2. A flood of traffic from users who share a single behavioral profile, such as device type, geolocation, or web browser version'
      '\n 3. An unexplained surge in requests to a single page or endpoint'
      '\n 4. Odd traffic patterns such as spikes at odd hours of the day or patterns that appear to be unnatural (e.g. a spike every 10 minutes)'
      '\n 5. There are other, more specific signs of DDoS attack that can vary depending on the type of attack.';
  static String ddos_S =
      'DDoS attacks are carried out with networks of Internet-connected machines.\n'
      'These networks consist of computers and other devices (such as IoT devices)which have been infected with malware, allowing them to be controlled remotely by an attacker.';

//Computer Worm

  static String worm_AD =
      'It often uses a computer network to spread itself, relying on security failures on the target computer to access it. It will use this machine as a host to scan and infect other computers. When these new worm-invaded computers are controlled,'
      ' the worm will continue to scan and infect other computers using these computers as hosts, and this behavior will continue.'
      ' Computer worms use recursive methods to copy themselves without host programs and distribute themselves based on the law of exponential growth, thus controlling and infecting more and more computers in a short time.'
      ' Worms almost always cause at least some harm to the network, even if only by consuming bandwidth, whereas viruses almost always corrupt or modify files on a targeted computer.'
      'Many worms are designed only to spread, and do not attempt to change the systems they pass through. However, as the Morris worm and Mydoom showed, even these "payload-free" worms can cause major'
      'disruption by increasing network traffic and other unintended effects.\n';
  static String worm_P =
      "\nYou can avoid being infected by a worm using common anti-malware advice. Use antivirus software,"
      "keep your computer up to date, and never open links or files which you don't completely trust. ";
  static String worm_S =
      'A computer worm is a standalone malware computer program that replicates itself in order to spread to other computers.\n';

//Brute Force
  static String brute_AD =
      "These attacks are done by ‘brute force’ meaning they use excessive forceful attempts to try and ‘force’ their way into your private account(s)."
      "This is an old attack method, but it's"
      "still effective and popular with hackers. Because"
      "depending on the length and complexity of the password,"
      "cracking it can take anywhere from a few seconds to many years.";
  static String brute_P = "How to protect yourself from this attack?"
      "\nUse an advanced username and password. "
      "Protect yourself with credentials that are stronger "
      "than admin and password1234 to keep out these attackers. "
      "The stronger this combination is, the harder it will be"
      " for anyone to penetrate it."
      " \nRemove any unused accounts with high-level permissions. These are the cyber"
      "equivalent of doors with weak locks that make breaking in easy."
      "Unmaintained accounts are a vulnerability you can’t risk."
      "Throw them away as soon as possible. ";
  static String brute_S =
      "A brute force attack uses trial-and-error to guess login info, encryption keys, or find a hidden web page. Hackers work through all possible combinations hoping to guess correctly.";
}

//Class created for Tips' Content
class TipsContent {
  static String backup =
      "If you become a victim of malware, such as ransomware, you might not be able to get your data back. That is, unless you’ve backed up your data. When you back up your data, you can make certain kinds of security breaches less problematic. If a hacker encrypts your data and demands a ransom to unencrypt it, it’s not going to be that big of a deal if you backed it up a week ago.";
  static String family =
      "You can be taking all the right precautions on your home security network, but if your family and other people using your network aren’t doing their part to keep everything secure, your efforts might not be enough. Make sure that everyone who regularly uses your network knows how to help keep it secure. Kids can learn about cyber safety, too.";
  static String password =
      "There are several ways to protect yourself from identity theft online, and using strong passwords is one of them. Unfortunately, even now, people still use passwords like “12345678” or “password.”";
  static String personal_information =
      "It’s easy to get comfortable with sharing a little too much personal information online. But you may be surprised at how much damage cybercriminals can do with just a little bit of information.  To keep it safe, never share identifying details, like your full name, address, or financial information with strangers you meet online. You should also be careful about the usernames you create for websites — there’s no need for them to include your real name.";
  static String update_device =
      "If you don’t have your security software, web browsers, and devices set to update automatically, turn on those automatic updates now. Updates often include critical fixes for any security holes that may have been detected in your programs or devices.";
  static String wifi =
      "If possible, try to avoid accessing unsecured public Wi-Fi on your devices. Using it can make you vulnerable to predatory practices. And if you must use it, avoid entering compromising information, like your Social Security number or financial information, on any websites. Better yet, use a VPN, or virtual private network, to do your browsing when you’re not at home. This will encrypt the data you send and receive, making it much harder to intercept.";
}
