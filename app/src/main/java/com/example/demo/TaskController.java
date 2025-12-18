package com.example.demo;

import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import java.util.*;

@RestController
@RequestMapping("/tasks")
public class TaskController {
    private final List<Task> tasks = new ArrayList<>();
    private long idCounter = 1;

    @GetMapping
    public List<Task> getAll() { return tasks; }

    @PostMapping
    public Task create(@Valid @RequestBody Task task) {
        task.setId(idCounter++);
        tasks.add(task);
        return task;
    }

    @PutMapping("/{id}")
    public Task update(@PathVariable Long id, @Valid @RequestBody Task task) {
        for (Task t : tasks) {
            if (t.getId().equals(id)) {
                t.setTitle(task.getTitle());
                t.setCompleted(task.isCompleted());
                return t;
            }
        }
        throw new NoSuchElementException("Task not found");
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        tasks.removeIf(t -> t.getId().equals(id));
    }
}
