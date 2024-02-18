class TasksController < ApplicationController
  get '/tasks' do
    # Step 9a:
    # Look up all the tasks in the database (by uncommenting the following line
    # tasks = Task.all
    # Step 9b:
    # Pass that list of all tasks to the `erb` partial by adding an extra argument to the erb call below:
    #   locals: { tasks: Task.all }
    # to the end of the line below (similar to what we did with our "Hello, World!" Sinatra app
    erb :"tasks/index.html"
  end


  # Step 20: Create a new Sinatra route for "/tasks/new"
  #   (see "Routes" in https://sinatrarb.com/intro.html if you need a hint,
  #   or just mimic what we have above for `/tasks`)
  #
  # Step 21: Let the tests prompt you to, add a line to render the erb file
  #   "tasks/new.html" (as before, you can refer to the code we have for `/tasks`)
  #
  #   P.S. Normally, you would have to create the erb view file yourself, but I have
  #   included it in this commit to save you some frustration




  # Step 26a: At this point, we need to create the task, and then
  #          redirect back to the homepage so that the user can see
  #          that the task was created.
  #
  #          For today, we will not be worrying about form validations,
  #          but we will be adding tests for those!
  post '/tasks' do
    # Step 27: After the tests reveal that you still haven't saved the task,
    #          uncomment these lines to actually save the data!
    #
    #          Note: ActiveRecord does sanitize the incoming data for us.
    #
    # task = Task.new(description: params[:description])
    # task.save!
    # Step 26b: Since your first test failure is "Not Found", you will start by
    #           uncommenting the following line, to redirect back to the homepage:
    # redirect "/"

    # Step 33: Modify the code above so that it uses an if/else statement to
    #          react to the task being valid/invalid.  You should render the 'new'
    #          form again if the data can't be saved.
    #
    #          NOTE: `task.save!` raises an error if the record can't be saved.
    #                 Switching to `task.save` returns a boolean that you can
    #                 use in the if/else statement
    #
    # Step 35: We will use `sinatra-flash` (https://github.com/SFEley/sinatra-flash)
    #          to add a message to our output. e.g. `flash.now[:errors] = ...`
    #          where ... is the full error message.  See the code sample here for
    #          an example of getting full error messages:
    #          https://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors-errors
  end

  # Step 38+:
  #   * You're going to have to add to this controller so that you can accept GET requests to e.g. `/tasks/4` (to render the edit form)
  #   * You will use route params (see: https://sinatrarb.com/intro.html#routes) for this.
  #   * You will also have to add to this controller so that you can accept PUT requests to e.g. `/tasks/4` (to save updates to the tasks)
  #   * This will give you some good hints on hooking everything together!: https://gist.github.com/victorwhy/45bb5637cd3e7e879ace
  #   * To delete a task: `task.destroy!`
end
