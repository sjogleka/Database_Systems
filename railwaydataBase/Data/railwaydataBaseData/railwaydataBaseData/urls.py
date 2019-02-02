"""railwaydataBaseData URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include,url
from django.contrib import admin
from railwayapp import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    #url(r'welcome/',include('railwayapp.urls')),
    url(r'^login_form/',views.login_form,name='login_form'),
    url(r'^index/',include('railwayapp.urls')),
    #url(r'^search/',include('railwayapp.urls')),
    #url(r'^test/',include('railwayapp.urls')),
    #url(r'^Availability/',include('railwayapp.urls')),
    #url(r'^Fare/',include('railwayapp.urls')),
    #url(r'^ST/',include('railwayapp.urls')),
    #url(r'^form_fare/',include('railwayapp.urls')),
    #url(r'^form_availability/',include('railwayapp.urls')),
    url(r'^signup/',views.signup,name='signup'),
    url(r'^Login/',views.Login,name='Login')
    #url(r'^home/',include('railwayapp.urls')),
]
