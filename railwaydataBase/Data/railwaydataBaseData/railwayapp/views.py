from django.views.generic import TemplateView
import random, string
from django.shortcuts import render,render_to_response
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection
from django.contrib.auth import authenticate, login, logout
# Create your views here.
from railwayapp.models import Train
#def index(request):
 #   return HttpResponse('Welcome ....')

def my_custom_sql(query):
    cursor = connection.cursor()
    temp=[]# Data modifying operation - commit required
    temp.append(cursor.execute(query))
    #transaction.commit_unless_managed()
    #row = []
    # Data retrieval operation - no commit required
    #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
    #row.append(cursor.fetchall())
    c=cursor.fetchall()
    #print(row)
    #print(c)
    return(c)
def my_custom_sql1(query):
    cursor = connection.cursor()
    temp=[]# Data modifying operation - commit required
    cursor.execute(query)
    c = cursor.fetchall()
    myVar1 = c[0]
    #transaction.commit_unless_managed()
    #row = []
    # Data retrieval operation - no commit required
    #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
    #row.append(cursor.fetchall())
    #c=cursor.fetchall()
    #print(row)
    print(myVar1[0])
    return(myVar1[0])
def my_custom_sql2(query):
    cursor = connection.cursor()
    temp=[]# Data modifying operation - commit required
    temp.append(cursor.execute(query))
    #transaction.commit_unless_managed()
    #row = []
    # Data retrieval operation - no commit required
    #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
    #row.append(cursor.fetchall())
    c=cursor.fetchall()
    list=[]
    print(c,len(c))
    x = len(c)
    for i in range(x):
        print(c[i][0])
        list.append(c[i][0])
        #print(list)
    #print(row)
    #print(c)
    return(list)
def signup(request):
    print("In Signup Form")
    return render(request,'login/form_signup.html')
def index(request):
    return render(request, 'login/home.html')
def form_fare(request):
    print("In Form")
    return render(request, 'login/form_Fare.html')
def form_availability(request):
    print("In View Form_Availability to Check Trains In Between")
    return render(request, 'login/form_availability.html')
def search(request):
    print("In search")
    if request.method == 'POST':
        search_id = request.POST.get('query', None)
        output = my_custom_sql(search_id)
        print(output)
        return render(request,'login/test.html',{'context':output})
    else:
        return (HttpResponse("<H1>Error .........</H1>"))
def unique(list1):
    # intilize a null list
    unique_list = []
    # traverse for all elements
    for x in list1:
        # check if exists in unique_list or not
        if x not in unique_list:
            unique_list.append(x)
            # print list
    for x in unique_list:
        print(x)
    return unique_list
def train(request):
    Train = request.POST.get('Train')
    User = request.POST.get('User')
    Station = request.POST.get('Station')
    print(Train,User)
    if Train=='':
        print("In Train")
        output = my_custom_sql("Select * from Train")
    elif User=='':
        print("In User")
        output = my_custom_sql("Select * from User")
        print(output)
    else:
        print("In Station")
        output = my_custom_sql("Select * from station")
        print(output)
    return render(request,'login/test.html',{'context':output})
def Availability(request):
        print("Get Available Seats")
        if request.method == 'POST':
            travel_day = request.POST.get('Travel Day', None)
            train_number = int(request.POST.get('train_number', None))
        else:
            return (HttpResponse("<H1>Error .........</H1>"))
        print(train_number,type(train_number))
        querywithstoreproc = "call availability(%d,'%s','%s')" %(train_number,travel_day,travel_day)
        q2 = "select no_available_seats from Availability where train_number =%d and train_running_day ='%s'"%(train_number,travel_day)
        print(querywithstoreproc,q2)
        my_custom_sql1(querywithstoreproc);
        finaloutput = my_custom_sql1(q2);
        print(finaloutput)
        return render(request,'login/Availability.html',{'context':finaloutput})
def ST(request):
    print("In Search Train")
    if request.method == 'POST':
        source = request.POST.get('source', None)
        destination = request.POST.get('destination', None)
        #train_number = request.POST.get('train_number', None)
    else:
        return (HttpResponse("<H1>Error .........</H1>"))
    q1 = "call inbetween('%s')" %(source)
    q2 = "call inbetween('%s')" %(destination)
    op = my_custom_sql2(q1)
    op1 = my_custom_sql2(q2)
    finaloutput = intersection(op,op1)
    finaloutput1 = []
    print("-------------------------------------------",op,op1)
    for i in range(len(finaloutput)):
        fop = '''select * from Train where train_number =%s;''' %(finaloutput[i])
        print(fop)
        op = my_custom_sql(fop)
        finaloutput1.append(op)
        print("finaloutput",i,finaloutput)
        print("----------------------------------------------------------------")
    return render(request, 'login/test.html',{'context':finaloutput1,'show':True})
def intersection(lst1, lst2):
    lst3 = [value for value in lst1 if value in lst2]
    return lst3
def form_book(request):
    print("In Form Book")
    return render(request, 'login/form_book.html',{'show' : False})
def Book(request):
    print("In main Book")
    show = True
    if request.method=='POST':
        print("In If")
        t_no = request.POST.get('train_number',None);
        t_day = request.POST.get('Travel_Day', None);
        no_pass = request.POST.get('no_of_pass', None);
        src = request.POST.get('Source', None);
        dest = request.POST.get('Destination', None);
        print(t_no,t_day,no_pass,src,dest)
        x = ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(10))
        print(x)
        q2 = "select no_available_seats from Availability where train_number =%d and train_running_day ='%s'" %(int(t_no),t_day)
        output1 = my_custom_sql2(q2);
        #q3 = "select total_capacity from Train where train_number = '%s'" %(int(t_no))
        #output2 = my_custom_sql(q3);
        print(output1[0])
        if output1[0]<=0:
            x = "Sorry Train is Full .."
            return render(request, 'login/Booked Ticket.html', {'context': x,'book':False})
        else:
            q = "insert into Ticket values('%s',%d,'%s',%d,'Confirm','%s','%s');" %(x,int(t_no),t_day,int(no_pass),src,dest)
            print(q)
            my_custom_sql(q)
            querywithstoreproc = "call availability(%d,'%s','%s')" % (int(t_no), t_day, t_day)
            my_custom_sql(querywithstoreproc);
            print(querywithstoreproc)
            return render(request, 'login/Booked Ticket.html', {'context': x,'book':True})
def Cancel(request):
    print("In Cancel")
    tck_no = request.POST.get('ticket_number', None);
    q2 = "update Ticket set ticket_status = 'Cancel' where ticket_no = '%s'" %(tck_no);
    print(q2)
    my_custom_sql(q2)
    return render(request, 'login/Cancel_Ticket.html')
def form_cancel(request):
    print("In Form Cancel")
    return render(request, 'login/form_cancel.html')
def BookTicket(request):
    print("In BookTicket")
    if request.method == 'POST':
        for i in range(4):
            p_email = request.POST.get('p_email',None);
            print(p_email)
    return render(request, 'login/test.html')
def merge_two_dicts(x, y):
    """Given two dicts, merge them into a new dict as a shallow copy."""
    z = {**x,**y}
    print("z",z)
    return z
def Fare(request):
    print("Fare")
    if request.method == 'POST':
        source = request.POST.get('source', None)
        destination = request.POST.get('destination', None)
        train_number = request.POST.get('train_number', None)
    else:
        return (HttpResponse("<H1>Error .........</H1>"))
    query2 = "call fare(%d,'%s','%s',@tfare);" %(int(train_number),source,destination)
    print(query2)
    my_custom_sql(query2);
    finaloutput = my_custom_sql1("select @tfare");
    print(finaloutput)
    if finaloutput<0:
        finaloutput = "Sorry Please select Valid Route..."
    return render(request, 'login/Fare.html', {'context': finaloutput})
def Login(request):
    print("In Login Form")
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username,password);
        check = "select password from UserAccount WHERE username ='%s'"%(username);
        print(check);
        check1 = my_custom_sql1(check);
        print(check1);
        if password == check1:

            return HttpResponse(render(request, "login/home.html",{'context': username}))
        else:
            return HttpResponse("invalid credentials")
    return render(request,'login/login_page.html')
def login_form(request):
    return render(request,'login/login_home.html')
def traininfo(trainno):
    print("In traininfo")
    trainno = int(trainno)
    c = connection.cursor()
    c.execute('SELECT * FROM Train WHERE train_number = %d' %(trainno))
    train = c.fetchone()
    c.execute('SELECT * FROM startsAt WHERE train_number = %d' %(trainno))
    stoppage = c.fetchall()
    print(type(stoppage))
    c.execute('SELECT * FROM station')
    scode = {}
    for row in c.fetchall():
        scode[str(row[0])] = str(row[1])
        print(scode)
    station = {}
    #for row in stoppage:
    #    station[str(row[1])] = scode[str(row[1])]
    print(stoppage)
    context = {"info":train, "stop":stoppage}
    print(context)
    return (context)
def enter_msg(request):
    print("In enter_msg")
    subject = request.POST.get('subject',None)
    mg = request.POST.get('comment',None)
    q2 = "INSERT INTO Message (subject_name,sender_username,receiver_username,message_body) VALUES ('%s','gaurav','spj','%s');" %(subject,mg);
    my_custom_sql(q2)
    q3 = "select * from Message;"
    finaloutput1 = []
    x = my_custom_sql(q3)
    finaloutput1.append(x)
    return render(request, 'login/test.html', {'context': finaloutput1})
def msg_admin(request):
    print("In Admin Message")
    return render(request, 'login/msg_admin.html')
def booking_history(request):
    print("In booking_history")
    query2 = "select * from bookinghistory WHERE username = 'sumedh'"
    print(query2)
    finalop = my_custom_sql(query2);
    return render(request, 'login/test.html', {'context': finalop})
def new_train(request):
    print("In New Train")
    return render(request, 'login/new_train.html')
def add_train(request):
    print("In Add Train")
    if request.method=='POST':
        print("In If")
        t_no = request.POST.get('train_number',None);
        t_name = request.POST.get('train_name', None);
        src = request.POST.get('source', None);
        dest = request.POST.get('destination', None);
        t_cap = request.POST.get('t_cap', None);
        base_fare = request.POST.get('base_fare', None);
        print(t_no,t_name,src,dest,t_cap,base_fare)
        q2 = "insert into Train values (%d,'%s','%s','%s',%d,%d)" %(int(t_no),t_name,src,dest,int(t_cap),int(base_fare))
        my_custom_sql(q2);
        finalop = []
        q3 = "select * from Train"
        op = my_custom_sql(q3);
        finalop.append(op)
    return render(request, 'login/test.html',{'context':finalop})

