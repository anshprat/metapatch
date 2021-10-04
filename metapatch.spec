Name:           metapatch
Version:        %{version}
Release:        1%{?dist}
Summary:        A meta patch package with only version changes
BuildArch:      noarch

License:        GPL
Source0:        %{name}-%{version}.tar.gz

Requires:       bash

%description
A Meta Patch package

%prep
%setup -q

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_bindir}
cp %{name}.sh $RPM_BUILD_ROOT/%{_bindir}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%{_bindir}/%{name}.sh

%changelog
* %{changelogdate} GPayBot <gpaybot@grabpay.com> - %{version}
- New Version being packaged
