import SwiftUI

// Task model to hold task details
struct Task: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
}

// Main ContentView showing the list of tasks
struct ContentView: View {
    @State private var tasks = [Task(title: "Task 1", description: "This is task 1", dueDate: Date()),
                                Task(title: "Task 2", description: "This is task 2", dueDate: Date())]
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                NavigationLink(destination: TaskDetailView(task: task)) {
                    Text(task.title)
                }
            }
            .navigationBarTitle("Task List")
            .navigationBarItems(trailing: NavigationLink(destination: AddTaskView(tasks: $tasks)) {
                Text("Add Task")
            })
        }
    }
}

// Add Task View to add a new task
struct AddTaskView: View {
    @Binding var tasks: [Task]
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            
            Button("Save Task") {
                let newTask = Task(title: title, description: description, dueDate: dueDate)
                tasks.append(newTask)
            }
            .disabled(title.isEmpty || description.isEmpty)
        }
        .navigationBarTitle("Add Task")
    }
}

// Task Detail View to display task details
struct TaskDetailView: View {
    var task: Task

    var body: some View {
        VStack(alignment: .leading) {
            Text("Title: \(task.title)").font(.title)
            Text("Description: \(task.description)").padding(.top)
            Text("Due Date: \(task.dueDate, formatter: DateFormatter())").padding(.top)
        }
        .padding()
        .navigationBarTitle("Task Details")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
