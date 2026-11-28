switch-pavilion:
  nh os switch -H pavilion

switch-precison:
  nh os switch -H precision --build-host precision --target-host precision

update-pavilion:
  nh os switch -H pavilion -u --refresh

update-precision:
  nh os switch -H precision --build-host precision --target-host precision -u --refresh
