# --
# Copyright (C) 2001-2016 OTRS AG, http://otrs.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

use strict;
use warnings;

use vars qw( $Self );

    # CustomerUser
    # (customer user database backend and custom settings)
    $Self->{CustomerUser} = {
        Name   => 'DB Customer Backend',
        Module => 'Kernel::System::CustomerUser::DB',
        Params => {
            Table => 'customer_user',
        },
        CustomerKey              => 'login',
        CustomerID               => 'customer_id',
        CustomerValid            => 'valid_id',
        CustomerUserListFields   => [ 'first_name', 'last_name', 'email' ],
        CustomerUserSearchFields => [
            'first_name', 'login', 'last_name', 'customer_id', 'email', 'company',
            'country',    'phone', 'mobile',    'invoicerecipient'
        ],
        CustomerUserPostMasterSearchFields => ['email'],
        CustomerUserEmailUniqCheck         => 0,
        CustomerUserNameFields             => [ 'first_name', 'last_name' ],
        CustomerUserSearchListLimit        => 10000,
        CustomerCompanySupport             => 1,
        CacheTTL                           => 350,
        Map                                => [
            [ 'UserTitle',             'Salutation',    'title',             1, 0, 'var' ],
            [ 'UserCompanySubsidiary', 'Subsidiary',    'company',           1, 0, 'var' ],
            [ 'UserStreet',            'Street/Number', 'street',            1, 0, 'var' ],
            [ 'UserPostalCode',        'Zip Code',      'postal',            1, 0, 'var' ],
            [ 'UserCity',              'City',          'city',              1, 0, 'var' ],
            [ 'UserFirstname',         'Firstname',     'first_name',        1, 1, 'var' ],
            [ 'UserLastname',          'Lastname',      'last_name',         1, 1, 'var' ],
            [ 'UserOrganisation',      'Organisation',  'organisation',      1, 0, 'var' ],
            [ 'UserFunction',          'JobTitle',      'customer_function', 1, 0, 'var' ],
            [ 'UserRole',              'User Role',     'role',              1, 0, 'var' ],
            [ 'UserBuilding',          'Building',      'building',          1, 0, 'var' ],
            [ 'UserDepartment',        'Department',    'department',        1, 0, 'var' ],
            [ 'UserDivision',          'Division',      'division',          1, 0, 'var' ],
            [ 'UserLogin',             'Login',         'login',             0, 1, 'var' ],
            [ 'UserCustomerID',        'CustomerID',    'customer_id',       0, 1, 'var' ],
            [ 'UserPassword',          'Password',      'pw',                0, 0, 'var' ],
            [ 'UserEmail',              'Email',        'email',             1, 1, 'var',
               '[% Env("CGIHandle") %]?Action=AdminCustomerUser;Subaction=Change;ID=[% Data.UserLogin | uri %]',
               0, '', 'AsPopup OTRSPopup_TicketAction'
            ],
            [ 'UserPhone',              'Phone',                      'phone',               1, 0, 'var' ],
            [ 'UserMobile',             'Mobile',                     'mobile',              1, 0, 'var' ],
            [ 'UserFax',                'Fax',                        'fax',                 1, 0, 'var' ],
            [ 'UserProvince',           'Province',                   'province',            0, 0, 'var' ],
            [ 'UserCountry',            'Country',                    'country',             1, 0, 'var' ],
            [ 'UserPOBox',              'P.O. Box',                   'po_box',              1, 0, 'var' ],
            [ 'UserPOBoxPostal',        'Zip Code (P.O. Box)',        'po_box_postal',       1, 0, 'var' ],
            [ 'UserTaxID',              'Sales/Tax ID',               'taxid',               1, 0, 'var' ],
            [ 'UserReferralSource',     'Referral Source',            'referral_source',     1, 0, 'var' ],
            [ 'UserInvoiceRecipient',   'Invoice Recipient',          'invoicerecipient',    1, 0, 'var' ],
            [ 'UserTimezone',           'Timezone',                   'Timezone',            1, 0, 'var' ],
            [ 'UserCommLanguage',       'Communication Language',     'comm_language',       1, 0, 'var' ],
            [ 'UserFirstContact',       'First Contact (DD.MM.YYYY)', 'first_contact',       1, 0, 'var' ],
            [ 'UserComment',            'Comment',                    'comments',            1, 0, 'var' ],
            [ 'UserNewsletterOTRS',     'OTRSNewsletter',             'newsletter_otrs',     0, 0, 'var' ],
            [ 'UserAccountDisabled',    'Account Disabled',           'account_disabled',    0, 0, 'var' ],
            [ 'UserRegistrationSource', 'Registration Source',        'registration_source', 0, 0, 'var' ],
            [ 'ValidID',                'Valid',                      'valid_id',            0, 1, 'int' ],
        ],

        # default selections
        Selections => {
            UserRole => {
                ''                        => '-',
                'Business User'           => 'Business User',
                'Decision Maker'          => 'Decision Maker',
                'Economic Buyer'          => 'Economic Buyer',
                'Economic Decision Maker' => 'Economic Decision Maker',
                'Evaluator'               => 'Evaluator',
                'Executive Sponsor'       => 'Executive Sponsor',
                'Influencer'              => 'Influencer',
                'Technical Buyer'         => 'Technical Buyer',
                'Other'                   => 'Other',
            },

            UserRegistrationSource => {
                'CustomerInterface'   => 'CustomerInterface',
                'AgentInterface'      => 'AgentInterface',
                'OTRSOnDemand'        => 'OTRSOnDemand',
                'RegistrationFormOld' => 'RegistrationFormOld',
            },

            UserNewsletterOTRS => {
                'Yes' => '1. Yes',
                'No'  => '2. No',
            },

            UserAccountDisabled => {
                ''    => '-',
                'No'  => 'No',
                'Yes' => 'Yes',
            },

            UserInvoiceRecipient => {
                ''         => '-',
                'Rechnung' => 'Rechnung',
            },

            UserCommLanguage => {
                ''        => '-',
                'English' => 'English',
                'German'  => 'German',
                'French'  => 'French',
                'Dutch'   => 'Dutch',
                'Spanish' => 'Spanish',
            },

            UserCountry => {
                ''                                             => '-',
                'AFGHANISTAN'                                  => 'AFGHANISTAN',
                'ALBANIA'                                      => 'ALBANIA',
                'ALGERIA'                                      => 'ALGERIA',
                'AMERICAN SAMOA'                               => 'AMERICAN SAMOA',
                'ANDORRA'                                      => 'ANDORRA',
                'ANGOLA'                                       => 'ANGOLA',
                'ANGUILLA'                                     => 'ANGUILLA',
                'ANTARCTICA'                                   => 'ANTARCTICA',
                'ANTIGUA AND BARBUDA'                          => 'ANTIGUA AND BARBUDA',
                'ARGENTINA'                                    => 'ARGENTINA',
                'ARMENIA'                                      => 'ARMENIA',
                'ARUBA'                                        => 'ARUBA',
                'AUSTRALIA'                                    => 'AUSTRALIA',
                'AUSTRIA'                                      => 'AUSTRIA',
                'AZERBAIJAN'                                   => 'AZERBAIJAN',
                'BAHAMAS'                                      => 'BAHAMAS',
                'BAHRAIN'                                      => 'BAHRAIN',
                'BANGLADESH'                                   => 'BANGLADESH',
                'BARBADOS'                                     => 'BARBADOS',
                'BELARUS'                                      => 'BELARUS',
                'BELGIUM'                                      => 'BELGIUM',
                'BELIZE'                                       => 'BELIZE',
                'BENIN'                                        => 'BENIN',
                'BERMUDA'                                      => 'BERMUDA',
                'BHUTAN'                                       => 'BHUTAN',
                'BOLIVIA'                                      => 'BOLIVIA',
                'BOSNIA AND HERZEGOWINA'                       => 'BOSNIA AND HERZEGOWINA',
                'BOTSWANA'                                     => 'BOTSWANA',
                'BOUVET ISLAND'                                => 'BOUVET ISLAND',
                'BRAZIL'                                       => 'BRAZIL',
                'BRITISH INDIAN OCEAN TERRITORY'               => 'BRITISH INDIAN OCEAN TERRITORY',
                'BRUNEI DARUSSALAM'                            => 'BRUNEI DARUSSALAM',
                'BULGARIA'                                     => 'BULGARIA',
                'BURKINA FASO'                                 => 'BURKINA FASO',
                'BURUNDI'                                      => 'BURUNDI',
                'CAMBODIA'                                     => 'CAMBODIA',
                'CAMEROON'                                     => 'CAMEROON',
                'CANADA'                                       => 'CANADA',
                'CAPE VERDE'                                   => 'CAPE VERDE',
                'CAYMAN ISLANDS'                               => 'CAYMAN ISLANDS',
                'CENTRAL AFRICAN REPUBLIC'                     => 'CENTRAL AFRICAN REPUBLIC',
                'CHAD'                                         => 'CHAD',
                'CHILE'                                        => 'CHILE',
                'CHINA'                                        => 'CHINA',
                'CHRISTMAS ISLAND'                             => 'CHRISTMAS ISLAND',
                'COCOS (KEELING) ISLANDS'                      => 'COCOS (KEELING) ISLANDS',
                'COLOMBIA'                                     => 'COLOMBIA',
                'COMOROS'                                      => 'COMOROS',
                'CONGO, Democratic Republic of (was Zaire)'    => 'CONGO, Democratic Republic of (was Zaire)',
                'CONGO, Republic of'                           => 'CONGO, Republic of',
                'COOK ISLANDS'                                 => 'COOK ISLANDS',
                'COSTA RICA'                                   => 'COSTA RICA',
                'COTE D\'IVOIRE'                               => 'COTE D\'IVOIRE',
                'CROATIA (local name: Hrvatska)'               => 'CROATIA (local name: Hrvatska)',
                'CUBA'                                         => 'CUBA',
                'CYPRUS'                                       => 'CYPRUS',
                'CZECH REPUBLIC'                               => 'CZECH REPUBLIC',
                'DENMARK'                                      => 'DENMARK',
                'DJIBOUTI'                                     => 'DJIBOUTI',
                'DOMINICA'                                     => 'DOMINICA',
                'DOMINICAN REPUBLIC'                           => 'DOMINICAN REPUBLIC',
                'ECUADOR'                                      => 'ECUADOR',
                'EGYPT'                                        => 'EGYPT',
                'EL SALVADOR'                                  => 'EL SALVADOR',
                'EQUATORIAL GUINEA'                            => 'EQUATORIAL GUINEA',
                'ERITREA'                                      => 'ERITREA',
                'ESTONIA'                                      => 'ESTONIA',
                'ETHIOPIA'                                     => 'ETHIOPIA',
                'FALKLAND ISLANDS (MALVINAS)'                  => 'FALKLAND ISLANDS (MALVINAS)',
                'FAROE ISLANDS'                                => 'FAROE ISLANDS',
                'FIJI'                                         => 'FIJI',
                'FINLAND'                                      => 'FINLAND',
                'FRANCE'                                       => 'FRANCE',
                'FRENCH GUIANA'                                => 'FRENCH GUIANA',
                'FRENCH POLYNESIA'                             => 'FRENCH POLYNESIA',
                'FRENCH SOUTHERN TERRITORIES'                  => 'FRENCH SOUTHERN TERRITORIES',
                'GABON'                                        => 'GABON',
                'GAMBIA'                                       => 'GAMBIA',
                'GEORGIA'                                      => 'GEORGIA',
                'GERMANY'                                      => 'GERMANY',
                'GHANA'                                        => 'GHANA',
                'GIBRALTAR'                                    => 'GIBRALTAR',
                'GREECE'                                       => 'GREECE',
                'GREENLAND'                                    => 'GREENLAND',
                'GRENADA'                                      => 'GRENADA',
                'GUADELOUPE'                                   => 'GUADELOUPE',
                'GUAM'                                         => 'GUAM',
                'GUATEMALA'                                    => 'GUATEMALA',
                'GUINEA'                                       => 'GUINEA',
                'GUINEA-BISSAU'                                => 'GUINEA-BISSAU',
                'GUYANA'                                       => 'GUYANA',
                'HAITI'                                        => 'HAITI',
                'HEARD AND MC DONALD ISLANDS'                  => 'HEARD AND MC DONALD ISLANDS',
                'HONDURAS'                                     => 'HONDURAS',
                'HONG KONG'                                    => 'HONG KONG',
                'HUNGARY'                                      => 'HUNGARY',
                'ICELAND'                                      => 'ICELAND',
                'INDIA'                                        => 'INDIA',
                'INDONESIA'                                    => 'INDONESIA',
                'IRAN (ISLAMIC REPUBLIC OF)'                   => 'IRAN (ISLAMIC REPUBLIC OF)',
                'IRAQ'                                         => 'IRAQ',
                'IRELAND'                                      => 'IRELAND',
                'ISRAEL'                                       => 'ISRAEL',
                'ITALY'                                        => 'ITALY',
                'JAMAICA'                                      => 'JAMAICA',
                'JAPAN'                                        => 'JAPAN',
                'JORDAN'                                       => 'JORDAN',
                'KAZAKHSTAN'                                   => 'KAZAKHSTAN',
                'KENYA'                                        => 'KENYA',
                'KIRIBATI'                                     => 'KIRIBATI',
                'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF'      => 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF',
                'KOREA, REPUBLIC OF'                           => 'KOREA, REPUBLIC OF',
                'KOSOVO'                                       => 'KOSOVO',
                'KUWAIT'                                       => 'KUWAIT',
                'KYRGYZSTAN'                                   => 'KYRGYZSTAN',
                'LAO PEOPLE\'S DEMOCRATIC REPUBLIC'            => 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC',
                'LATVIA'                                       => 'LATVIA',
                'LEBANON'                                      => 'LEBANON',
                'LESOTHO'                                      => 'LESOTHO',
                'LIBERIA'                                      => 'LIBERIA',
                'LIBYAN ARAB JAMAHIRIYA'                       => 'LIBYAN ARAB JAMAHIRIYA',
                'LIECHTENSTEIN'                                => 'LIECHTENSTEIN',
                'LITHUANIA'                                    => 'LITHUANIA',
                'LUXEMBOURG'                                   => 'LUXEMBOURG',
                'MACAU'                                        => 'MACAU',
                'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF'   => 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF',
                'MADAGASCAR'                                   => 'MADAGASCAR',
                'MALAWI'                                       => 'MALAWI',
                'MALAYSIA'                                     => 'MALAYSIA',
                'MALDIVES'                                     => 'MALDIVES',
                'MALI'                                         => 'MALI',
                'MALTA'                                        => 'MALTA',
                'MARSHALL ISLANDS'                             => 'MARSHALL ISLANDS',
                'MARTINIQUE'                                   => 'MARTINIQUE',
                'MAURITANIA'                                   => 'MAURITANIA',
                'MAURITIUS'                                    => 'MAURITIUS',
                'MAYOTTE'                                      => 'MAYOTTE',
                'MEXICO'                                       => 'MEXICO',
                'MICRONESIA, FEDERATED STATES OF'              => 'MICRONESIA, FEDERATED STATES OF',
                'MOLDOVA, REPUBLIC OF'                         => 'MOLDOVA, REPUBLIC OF',
                'MONACO'                                       => 'MONACO',
                'MONGOLIA'                                     => 'MONGOLIA',
                'MONTSERRAT'                                   => 'MONTSERRAT',
                'MOROCCO'                                      => 'MOROCCO',
                'MOZAMBIQUE'                                   => 'MOZAMBIQUE',
                'MYANMAR'                                      => 'MYANMAR',
                'NAMIBIA'                                      => 'NAMIBIA',
                'NAURU'                                        => 'NAURU',
                'NEPAL'                                        => 'NEPAL',
                'NETHERLANDS'                                  => 'NETHERLANDS',
                'NETHERLANDS ANTILLES'                         => 'NETHERLANDS ANTILLES',
                'NEW CALEDONIA'                                => 'NEW CALEDONIA',
                'NEW ZEALAND'                                  => 'NEW ZEALAND',
                'NICARAGUA'                                    => 'NICARAGUA',
                'NIGER'                                        => 'NIGER',
                'NIGERIA'                                      => 'NIGERIA',
                'NIUE'                                         => 'NIUE',
                'NORFOLK ISLAND'                               => 'NORFOLK ISLAND',
                'NORTHERN MARIANA ISLANDS'                     => 'NORTHERN MARIANA ISLANDS',
                'NORWAY'                                       => 'NORWAY',
                'OMAN'                                         => 'OMAN',
                'PAKISTAN'                                     => 'PAKISTAN',
                'PALAU'                                        => 'PALAU',
                'PALESTINIAN TERRITORY, Occupied'              => 'PALESTINIAN TERRITORY, Occupied',
                'PANAMA'                                       => 'PANAMA',
                'PAPUA NEW GUINEA'                             => 'PAPUA NEW GUINEA',
                'PARAGUAY'                                     => 'PARAGUAY',
                'PERU'                                         => 'PERU',
                'PHILIPPINES'                                  => 'PHILIPPINES',
                'PITCAIRN'                                     => 'PITCAIRN',
                'POLAND'                                       => 'POLAND',
                'PORTUGAL'                                     => 'PORTUGAL',
                'PUERTO RICO'                                  => 'PUERTO RICO',
                'QATAR'                                        => 'QATAR',
                'REUNION'                                      => 'REUNION',
                'ROMANIA'                                      => 'ROMANIA',
                'RUSSIAN FEDERATION'                           => 'RUSSIAN FEDERATION',
                'RWANDA'                                       => 'RWANDA',
                'SAINT HELENA'                                 => 'SAINT HELENA',
                'SAINT KITTS AND NEVIS'                        => 'SAINT KITTS AND NEVIS',
                'SAINT LUCIA'                                  => 'SAINT LUCIA',
                'SAINT PIERRE AND MIQUELON'                    => 'SAINT PIERRE AND MIQUELON',
                'SAINT VINCENT AND THE GRENADINES'             => 'SAINT VINCENT AND THE GRENADINES',
                'SAMOA'                                        => 'SAMOA',
                'SAN MARINO'                                   => 'SAN MARINO',
                'SAO TOME AND PRINCIPE'                        => 'SAO TOME AND PRINCIPE',
                'SAUDI ARABIA'                                 => 'SAUDI ARABIA',
                'SENEGAL'                                      => 'SENEGAL',
                'SERBIA'                                       => 'SERBIA',
                'SEYCHELLES'                                   => 'SEYCHELLES',
                'SIERRA LEONE'                                 => 'SIERRA LEONE',
                'SINGAPORE'                                    => 'SINGAPORE',
                'SLOVAKIA'                                     => 'SLOVAKIA',
                'SLOVENIA'                                     => 'SLOVENIA',
                'SOLOMON ISLANDS'                              => 'SOLOMON ISLANDS',
                'SOMALIA'                                      => 'SOMALIA',
                'SOUTH AFRICA'                                 => 'SOUTH AFRICA',
                'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS' => 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS',
                'SPAIN'                                        => 'SPAIN',
                'SRI LANKA'                                    => 'SRI LANKA',
                'SUDAN'                                        => 'SUDAN',
                'SURINAME'                                     => 'SURINAME',
                'SVALBARD AND JAN MAYEN ISLANDS'               => 'SVALBARD AND JAN MAYEN ISLANDS',
                'SWAZILAND'                                    => 'SWAZILAND',
                'SWEDEN'                                       => 'SWEDEN',
                'SWITZERLAND'                                  => 'SWITZERLAND',
                'SYRIAN ARAB REPUBLIC'                         => 'SYRIAN ARAB REPUBLIC',
                'TAIWAN'                                       => 'TAIWAN',
                'TAJIKISTAN'                                   => 'TAJIKISTAN',
                'TANZANIA, UNITED REPUBLIC OF'                 => 'TANZANIA, UNITED REPUBLIC OF',
                'THAILAND'                                     => 'THAILAND',
                'TIMOR-LESTE'                                  => 'TIMOR-LESTE',
                'TOGO'                                         => 'TOGO',
                'TOKELAU'                                      => 'TOKELAU',
                'TONGA'                                        => 'TONGA',
                'TRINIDAD AND TOBAGO'                          => 'TRINIDAD AND TOBAGO',
                'TUNISIA'                                      => 'TUNISIA',
                'TURKEY'                                       => 'TURKEY',
                'TURKMENISTAN'                                 => 'TURKMENISTAN',
                'TURKS AND CAICOS ISLANDS'                     => 'TURKS AND CAICOS ISLANDS',
                'TUVALU'                                       => 'TUVALU',
                'UGANDA'                                       => 'UGANDA',
                'UKRAINE'                                      => 'UKRAINE',
                'UNITED ARAB EMIRATES'                         => 'UNITED ARAB EMIRATES',
                'UNITED KINGDOM'                               => 'UNITED KINGDOM',
                'UNITED STATES'                                => 'UNITED STATES',
                'UNITED STATES MINOR OUTLYING ISLANDS'         => 'UNITED STATES MINOR OUTLYING ISLANDS',
                'URUGUAY'                                      => 'URUGUAY',
                'UZBEKISTAN'                                   => 'UZBEKISTAN',
                'VANUATU'                                      => 'VANUATU',
                'VATICAN CITY STATE (HOLY SEE)'                => 'VATICAN CITY STATE (HOLY SEE)',
                'VENEZUELA'                                    => 'VENEZUELA',
                'VIET NAM'                                     => 'VIET NAM',
                'VIRGIN ISLANDS (BRITISH)'                     => 'VIRGIN ISLANDS (BRITISH)',
                'VIRGIN ISLANDS (U.S.)'                        => 'VIRGIN ISLANDS (U.S.)',
                'WALLIS AND FUTUNA ISLANDS'                    => 'WALLIS AND FUTUNA ISLANDS',
                'WESTERN SAHARA'                               => 'WESTERN SAHARA',
                'YEMEN'                                        => 'YEMEN',
                'ZAMBIA'                                       => 'ZAMBIA',
                'ZIMBABWE'                                     => 'ZIMBABWE',
                'LETTLAND'                                     => 'LETTLAND',
            },

            UserTimezone => {
                ''       => '-',
                '-12'    => 'UTC -12 Eniwetok, Kwajalein',
                '-11'    => 'UTC -11 Midway Island, Samoa',
                '-10'    => 'UTC -10 Hawaii',
                '-09'    => 'UTC -09 Alaska',
                '-08'    => 'UTC -08 Pacific Time (USA); Tijuana',
                '-07'    => 'UTC -07 Mountain Time (USA), Arizona',
                '-06'    => 'UTC -06 Central Time (USA), Saskatchewan, Mexico City, Tegucigalpa',
                '-05'    => 'UTC -05 Eastern Time (USA), Indiana East, Bogota, Lima, Quito',
                '-04'    => 'UTC -04 Atlantic Time (Canada), Caracas, La Paz, Santiago',
                '-03'    => 'UTC -03 Brasilia, Buenos Aires, Georgetown',
                '-02'    => 'UTC -02 Mid-Atlantic',
                '-01'    => 'UTC -01 Azores, Cape Verde Is.',
                '-00'    => 'UTC Dublin, Edinburgh, Lisbon, London, Casablanca, Monrovia',
                '+01'    => 'UTC +01 Belgrade, Bratislava, Budapest, Ljubljana, Prague',
                '+01'    => 'UTC +01 Amsterdam, Berlin, Rome, Madrid, Sofia, Zagreb, Bern, Vienna',
                '+02'    => 'UTC +02 Bucharest, Cairo, Helsinki, Riga Tallinn, Athens, Istanbul, Minsk, Jerusalem',
                '+03'    => 'UTC +03 Moscow, St. Petersburg, Volgograd, Baghdad, Kuwait, Riyadh, Nairobi',
                '+04'    => 'UTC +04 Abu Dhabi, Muscat, Baku, Tbilisi',
                '+05'    => 'UTC +05 Ekaterinburg, Islamabad, Karachi, Tashkent',
                '+05:30' => 'UTC +05:30 India, Sri Lanka',
                '+06'    => 'UTC +06 Astana, Almaty, Dhaka, Colombo',
                '+07'    => 'UTC +07 Bangkok, Hanoi, Jakarta',
                '+08'    => 'UTC +08 Beijing, Chongqing, Hong Kong, Urumqi, Singapore, Taipei, Perth',
                '+09'    => 'UTC +09 Osaka, Sapporo, Tokyo, Seoul, Yakutsk',
                '+09:30' => 'UTC +09:30 Australia',
                '+10'    => 'UTC +10 Canberra, Melbourne, Sydney, Brisbane, Hobart, Vladivostok',
                '+11'    => 'UTC +11 Magadan, Solomon Is., New Caledonia',
                '+12'    => 'UTC +12 Fiji, Kamchatka, Marshall Is., Auckland, Wellington',
            },
        },
    };

1;

=head1 TERMS AND CONDITIONS

This software is part of the OTRS project (L<http://otrs.org/>).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (AGPL). If you
did not receive this file, see L<http://www.gnu.org/licenses/agpl.txt>.

=cut


