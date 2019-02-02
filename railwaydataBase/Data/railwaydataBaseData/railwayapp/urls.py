from django.conf.urls import include,url
from django.contrib import admin
from railwayapp import views
#from railwayapp.views import HomeView
admin.autodiscover()
urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    #url(r'^$',views.test,name='index'),
    #url(r'^$/',views.login_form,name='login_form'),
    url(r'^$',views.index,name='index'),
    url(r'^search/',views.search,name='search'),
    url(r'^test/',views.search,name='test'),
    url(r'^Availability/',views.Availability,name='Availability'),
    url(r'^form_fare/Fare/',views.Fare,name='Fare'),
    #url(r'^ST/',views.ST,name='ST'),
    url(r'^form_availability/ST/',views.ST,name='ST'),
    url(r'^train/',views.train,name='train'),
    url(r'^form_fare/',views.form_fare,name='form_fare'),
    url(r'^form_book/Book/BookTicket/', views.BookTicket, name='BookTicket'),
    url(r'^form_book/Book/', views.Book, name='Book'),
    url(r'^form_book/',views.form_book,name='form_book'),
    url(r'^form_cancel/Cancel/', views.Cancel, name='Cancel'),
    url(r'^form_cancel/',views.form_cancel,name='form_cancel'),
    url(r'^form_availability/',views.form_availability,name='form_availability'),
    url(r'^msg_admin/enter_msg/',views.enter_msg,name='enter_msg'),
    url(r'^msg_admin/',views.msg_admin,name='msg_admin'),
    url(r'^booking_history/',views.booking_history,name='booking_history'),
    url(r'^new_train/add_train/',views.add_train,name='add_train'),
    url(r'^new_train/',views.new_train,name='new_train'),
    url(r'^traininfo/',views.traininfo,name='traininfo'),
    #url(r'^signup/',views.signup,name='signup'),
]
