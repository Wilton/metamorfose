<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center" style="background-color:  #2f78e9">
    <a class="" href="{{ url('/') }}"><img src="{{asset('/images/akinami_logo.png')}}" width="100px" style="background-color: #2f78e9">
      </a>
    <a class="navbar-brand brand-logo-mini" href="{{ url('/') }}"></a>
  </div>
  <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-menu"></span>
    </button>
    <ul class="navbar-nav navbar-nav-left header-links">
      <li class="nav-item d-none d-xl-flex">
        <a href="#" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-md-flex">
        <a href="#" class="nav-link">
          <i class="mmdi mdi-account-multiple-outline"></i>Class Roster</a>
      </li>
      <li class="nav-item d-none d-md-flex">
        <a href="#" class="nav-link">
          <i class="mdi mdi mdi-calendar"></i>Calendar</a>
      </li>
      <li class="nav-item dropdown d-none d-lg-flex">
        <a class="nav-link dropdown-toggle px-0" id="quickDropdown" href="#" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-numeric-2-box-multiple-outline"></i>Reports  & Stats</a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown pt-3" aria-labelledby="quickDropdown">
          <strong>Reports</strong>
          <a href="#" class="dropdown-item">Retention Report</a>
          <a href="#" class="dropdown-item">Inactive Report</a>
          <a href="#" class="dropdown-item">Attendance by Class</a>
          <a href="#" class="dropdown-item">Cerimony Processing</a>
          <a href="#" class="dropdown-item">Graduation Report</a>
          <strong>Stats</strong>
          <a href="#" class="dropdown-item">Demographics</a>
          {{-- <a href="#" class="dropdown-item"><i class="mdi mdi-elevation-rise"></i>Reports</a> --}}
        </div>
      </li>
      <li class="nav-item dropdown d-none d-lg-flex">
        <a class="nav-link dropdown-toggle px-0" id="quickDropdown" href="#" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-webhook"></i>Maintenance</a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown pt-3" aria-labelledby="quickDropdown"> 
          <a href="#" class="dropdown-item">Class Calendar</a>
          <a href="#" class="dropdown-item">Email Templates</a>
          <a href="#" class="dropdown-item">Email Groups</a>
          <a href="#" class="dropdown-item">Eye on Events</a> 
          <a href="#" class="dropdown-item">Belt Setup</a>
          <a href="#" class="dropdown-item">Programs</a>
          <a href="#" class="dropdown-item">Discipline</a>
          <a href="#" class="dropdown-item">Status Code</a>
          <a href="#" class="dropdown-item">Ad Type</a>
          <a href="#" class="dropdown-item">Document Types</a>
          <a href="#" class="dropdown-item">Contract Templates</a>
          <a href="#" class="dropdown-item">Sign in Ticker</a>
          <a href="#" class="dropdown-item">Student Sign in</a>
          <a href="#" class="dropdown-item">Improvement Tracker</a>
          <a href="#" class="dropdown-item">New Students</a>
          {{-- <a href="#" class="dropdown-item"><i class="mdi mdi-elevation-rise"></i>Reports</a> --}}
        </div>
      </li>
      <li class="nav-item dropdown d-none d-lg-flex">
        <a class="nav-link dropdown-toggle px-0" id="quickDropdown" href="#" data-toggle="dropdown" aria-expanded="false"><i class="mdi mdi-numeric-2-box-multiple-outline"></i>Account[User Logged In]</a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown pt-3" aria-labelledby="quickDropdown">
          <a href="#" class="dropdown-item">Account settings</a>
          <a href="#" class="dropdown-item">Logout</a>
        </div>
      </li>
      <li class="nav-item d-none d-md-flex">
        <a href="#" class="nav-link">
          <i class="mdi mdi-store"></i>Public Site</a>
      </li>
      <li class="nav-item d-none d-md-flex">
        <a href="#" class="nav-link">
          <i class="mdi mdi-tablet"></i>Tablet Screen</a>
      </li>
     
    </ul>
    <ul class="navbar-nav navbar-nav-right">
      
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span class="mdi mdi-menu icon-menu"></span>
    </button>
  </div>
</nav>