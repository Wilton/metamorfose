<template>
  <v-container fluid class="elements-page mt-3">
    <v-card width="100vw">
      <v-card-title>Prospect</v-card-title>
      <v-card-text>
        <v-row>
          <v-col cols="12" md="4">
            <v-col cols="12" md="12">
              <v-row>
                <v-col cols="12" md="12">
                  <v-card outlined>
                    <v-card-text>
                      <v-row class="d-flex justify-space-around">
                        <v-col cols="12" md="6">
                          <v-checkbox v-model="form.active" label="Active"></v-checkbox>
                        </v-col>
                        <v-col cols="12" md="6">
                          <v-checkbox v-model="form.enrolled" label="Enrolled"></v-checkbox>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-menu ref="menu_to" v-model="menuCallDate" :close-on-content-click="false" :return-value.sync="form.callDate" transition="scale-transition" offset-y min-width="auto" >
                            <template v-slot:activator="{ on, attrs }">
                              <v-text-field v-model="form.callDate" label="Call Date" prepend-icon="mdi-calendar" readonly v-bind="attrs" v-on="on"></v-text-field>
                            </template>
                            <v-date-picker v-model="form.callDate" no-title scrollable>
                              <v-spacer></v-spacer>
                              <v-btn text color="primary" @click="menuCallDate = false"> Cancel </v-btn>
                              <v-btn text color="primary" @click="$refs.menu_to.save(form.callDate)">OK</v-btn>
                            </v-date-picker>
                          </v-menu>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-select v-model="form.advType" :items="adTypes" label="Adv. Type" ></v-select>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.referredBy" label="Referred by"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.firstName" label="First Name"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.middleName" label="Middle Name"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.lastName" label="Last Name"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-select v-model="form.gender" :items="genders" label="Gender"></v-select>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="8">
                          <v-menu ref="menu_to" v-model="menuBirthDate" :close-on-content-click="false" :return-value.sync="form.birthDate" transition="scale-transition" offset-y min-width="auto" >
                            <template v-slot:activator="{ on, attrs }">
                              <v-text-field v-model="form.birthDate" label="Birth Date" prepend-icon="mdi-calendar" readonly v-bind="attrs" v-on="on"></v-text-field>
                            </template>
                            <v-date-picker v-model="form.birthDate" no-title scrollable>
                              <v-spacer></v-spacer>
                              <v-btn text color="primary" @click="menuBirthDate = false"> Cancel </v-btn>
                              <v-btn text color="primary" @click="$refs.menuBirthDate.save(form.birthDate)">OK</v-btn>
                            </v-date-picker>
                          </v-menu>
                        </v-col>
                        <v-col cols="12" md="4">
                          <v-text-field v-model="form.age" label="Age"></v-text-field>
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" md="12">
                  <v-card outlined>
                    <v-card-title>Contact</v-card-title>
                    <v-card-text>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.first" label="First"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.last" label="Last"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-select v-model="form.relationship" :items="relationships" label="Relationship"></v-select>
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" md="12">
                  <v-card outlined>
                    <v-card-title>Phone(s)</v-card-title>
                    <v-card-text>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-subheader inset>Phone(s)</v-subheader>
                          <v-divider inset></v-divider>
                          <v-text-field v-model="form.cell" v-mask="'(###) ###-####'"  label="Cell"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="6">
                          <v-checkbox v-model="form.allowTextMessage" label="Allow Text Messages"></v-checkbox>
                        </v-col>
                        <v-col cols="12" md="6">
                          <v-text-field v-model="form.altPhone" v-mask="'(###) ###-####'" label="Alt.Phone"></v-text-field>
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" md="12">
                  <v-card outlined>
                    <v-card-title>Email(s)</v-card-title>
                    <v-card-text>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.email1" label="Email 1"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.email2" label="Email 2"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.sms" label="SMS"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.mms" label="MMS"></v-text-field>
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>

              <v-row>
                <v-col cols="12" md="12">
                  <v-card outlined>
                    <v-card-title>Address</v-card-title>
                    <v-card-text>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-subheader inset>Address</v-subheader>
                          <v-divider inset></v-divider>
                          <v-text-field v-model="form.addr1" label="Addr1"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.addr2" label="Addr2"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="12">
                          <v-text-field v-model="form.city" label="City"></v-text-field>
                        </v-col>
                      </v-row>
                      <v-row>
                        <v-col cols="12" md="6">
                          <v-combobox v-model="form.state" :items="states" item-text="name" item-value="abbreviation" label="State"></v-combobox>
                        </v-col>
                        <v-col cols="12" md="6">
                          <v-text-field v-model="form.zip" v-mask="'#####'" label="Zip"></v-text-field>
                        </v-col>
                      </v-row>
                    </v-card-text>
                  </v-card>
                </v-col>
              </v-row>
            </v-col>
          </v-col>
          <v-col cols="12" md="4">
            <v-card outlined>
              <v-card-text>
                <v-row>
                  <v-col cols="12" md="12">
                    <v-row>
                      <v-col cols="12" md="12">
                        <v-datetime-picker label="Quick Apt" v-model="form.quickApt" >
                          <template v-slot:dateIcon>
                            <v-icon>mdi-calendar</v-icon>
                          </template>
                          <template v-slot:timeIcon>
                            <v-icon>mdi-clock-time-four-outline</v-icon>
                          </template>
                        </v-datetime-picker>
                      </v-col>
                    </v-row>
                    <v-row>
                      <v-col>
                        <v-btn small>New Apt</v-btn>
                        <v-btn small>Refresh</v-btn>
                      </v-col>
                    </v-row>
                    <v-row>
                      Appointments
                    </v-row>
                    <v-row>
                      <v-col cols="12" md="12">
                        <v-textarea v-model="form.notes" label="Notes" value="" hint="Notes"></v-textarea>
                      </v-col>
                    </v-row>
                  </v-col>
                </v-row>
              </v-card-text>
            </v-card>
          </v-col>

          <v-col cols="12" md="4">
            <v-card outlined>
              <v-card-text>
                <v-row class="d-flex justify-space-around">
                  <v-col cols="12" md="5">
                    <v-checkbox v-model="form.sendEmailOnSave" label="Send Email on Save"></v-checkbox>
                  </v-col>
                  <v-col cols="12" md="7">
                    <v-btn small >Send E-mail</v-btn>
                    <v-btn small >Send Text</v-btn>
                    <v-btn small>Refresh</v-btn>
                  </v-col>
                </v-row>
                <v-row>
                  <v-col cols="12" md="12">
                    <v-simple-table>
                      <template v-slot:default>
                        <thead>
                          <tr>
                            <th class="text-left">
                              Date
                            </th>
                            <th class="text-left">
                              Email Name/Subject
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="item in desserts" :key="item.name">
                            <td>{{ item.name }}</td>
                            <td>{{ item.calories }}</td>
                          </tr>
                        </tbody>
                      </template>
                    </v-simple-table>
                  </v-col>
                </v-row>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import { limparForm } from "../utils/limparForm"

export default {
  name: "Prospect",
  data: () => ({
    dialog: false,
    dialogEdit: false,
    menuCallDate: '',
    menuBirthDate: '',
    relationships: [
      'Aunt',
      'Brother',
      'Father',
      'Friend'
    ],
    adTypes: [
      "Facebook",
      "Family Member",
      "Flyer",
      "Google",
      "Google - other",
      "Google Waiting List",
      "POWr",
      "Referral",
      "Referral - other",
      "Referral Waiting List",
      "Walk by",
      "Walk by - other",
      "Walk By Waiting List",
      "Website Lead",
      "Website Lead - other",
      "Website Lead Waiting List",
      "Xmas Stocking",
      "Xmas Stocking - other",
      "Yelp",
    ],
    states: [
        {
            "name": "Alabama",
            "abbreviation": "AL"
        },
        {
            "name": "Alaska",
            "abbreviation": "AK"
        },
        {
            "name": "American Samoa",
            "abbreviation": "AS"
        },
        {
            "name": "Arizona",
            "abbreviation": "AZ"
        },
        {
            "name": "Arkansas",
            "abbreviation": "AR"
        },
        {
            "name": "California",
            "abbreviation": "CA"
        },
        {
            "name": "Colorado",
            "abbreviation": "CO"
        },
        {
            "name": "Connecticut",
            "abbreviation": "CT"
        },
        {
            "name": "Delaware",
            "abbreviation": "DE"
        },
        {
            "name": "District Of Columbia",
            "abbreviation": "DC"
        },
        {
            "name": "Federated States Of Micronesia",
            "abbreviation": "FM"
        },
        {
            "name": "Florida",
            "abbreviation": "FL"
        },
        {
            "name": "Georgia",
            "abbreviation": "GA"
        },
        {
            "name": "Guam",
            "abbreviation": "GU"
        },
        {
            "name": "Hawaii",
            "abbreviation": "HI"
        },
        {
            "name": "Idaho",
            "abbreviation": "ID"
        },
        {
            "name": "Illinois",
            "abbreviation": "IL"
        },
        {
            "name": "Indiana",
            "abbreviation": "IN"
        },
        {
            "name": "Iowa",
            "abbreviation": "IA"
        },
        {
            "name": "Kansas",
            "abbreviation": "KS"
        },
        {
            "name": "Kentucky",
            "abbreviation": "KY"
        },
        {
            "name": "Louisiana",
            "abbreviation": "LA"
        },
        {
            "name": "Maine",
            "abbreviation": "ME"
        },
        {
            "name": "Marshall Islands",
            "abbreviation": "MH"
        },
        {
            "name": "Maryland",
            "abbreviation": "MD"
        },
        {
            "name": "Massachusetts",
            "abbreviation": "MA"
        },
        {
            "name": "Michigan",
            "abbreviation": "MI"
        },
        {
            "name": "Minnesota",
            "abbreviation": "MN"
        },
        {
            "name": "Mississippi",
            "abbreviation": "MS"
        },
        {
            "name": "Missouri",
            "abbreviation": "MO"
        },
        {
            "name": "Montana",
            "abbreviation": "MT"
        },
        {
            "name": "Nebraska",
            "abbreviation": "NE"
        },
        {
            "name": "Nevada",
            "abbreviation": "NV"
        },
        {
            "name": "New Hampshire",
            "abbreviation": "NH"
        },
        {
            "name": "New Jersey",
            "abbreviation": "NJ"
        },
        {
            "name": "New Mexico",
            "abbreviation": "NM"
        },
        {
            "name": "New York",
            "abbreviation": "NY"
        },
        {
            "name": "North Carolina",
            "abbreviation": "NC"
        },
        {
            "name": "North Dakota",
            "abbreviation": "ND"
        },
        {
            "name": "Northern Mariana Islands",
            "abbreviation": "MP"
        },
        {
            "name": "Ohio",
            "abbreviation": "OH"
        },
        {
            "name": "Oklahoma",
            "abbreviation": "OK"
        },
        {
            "name": "Oregon",
            "abbreviation": "OR"
        },
        {
            "name": "Palau",
            "abbreviation": "PW"
        },
        {
            "name": "Pennsylvania",
            "abbreviation": "PA"
        },
        {
            "name": "Puerto Rico",
            "abbreviation": "PR"
        },
        {
            "name": "Rhode Island",
            "abbreviation": "RI"
        },
        {
            "name": "South Carolina",
            "abbreviation": "SC"
        },
        {
            "name": "South Dakota",
            "abbreviation": "SD"
        },
        {
            "name": "Tennessee",
            "abbreviation": "TN"
        },
        {
            "name": "Texas",
            "abbreviation": "TX"
        },
        {
            "name": "Utah",
            "abbreviation": "UT"
        },
        {
            "name": "Vermont",
            "abbreviation": "VT"
        },
        {
            "name": "Virgin Islands",
            "abbreviation": "VI"
        },
        {
            "name": "Virginia",
            "abbreviation": "VA"
        },
        {
            "name": "Washington",
            "abbreviation": "WA"
        },
        {
            "name": "West Virginia",
            "abbreviation": "WV"
        },
        {
            "name": "Wisconsin",
            "abbreviation": "WI"
        },
        {
            "name": "Wyoming",
            "abbreviation": "WY"
        }
    ],
    genders: [
      'Male',
      'Female'
    ],
    form: {
      active: '',
      enrolled: '',
      callDate: '',
      advType: '',
      referredBy: '',
      firstName: '',
      middleName: '',
      lastName: '',
      gender: '',
      birthDate: '',
      age: '',
      first: '',
      last: '',
      relationship: '',
      cell: '',
      allowTextMessage: '',
      altPhone: '',
      email1: '',
      email2: '',
      sms: '',
      mms: '',
      addr1: '',
      addr2: '',
      city: '',
      state: '',
      zip: '',
      quickApt: '',
      notes: '',
      sendEmailOnSave: '',



    },
    items: [
      { description: "Facebook", active: true } ,
      { description: "Family Member", active: true } ,
      { description: "Flyer", active: true } ,
      { description: "Google", active: true } ,
      { description: "Google - other", active: true } ,
      { description: "Google Waiting List", active: true } ,
      { description: "POWr", active: true } ,
      { description: "Referral", active: true } ,
      { description: "Referral - other", active: true } ,
      { description: "Referral Waiting List", active: true } ,
      { description: "Walk by", active: true } ,
      { description: "Walk by - other", active: true } ,
      { description: "Walk By Waiting List", active: true } ,
      { description: "Website Lead", active: true } ,
      { description: "Website Lead - other", active: true } ,
      { description: "Website Lead Waiting List", active: true } ,
      { description: "Xmas Stocking", active: true } ,
      { description: "Xmas Stocking - other", active: true } ,
      { description: "Yelp", active: true } ,
    ],
  }),
  methods: {
      openDialog () {
        limparForm(this.form)
        this.dialog = true
      },
      openDialogEdit (item) {
        this.formEdit = item
        this.dialogEdit = true
      },
      closeDialog() {
        this.dialog=false
      }
    },
};
</script>

