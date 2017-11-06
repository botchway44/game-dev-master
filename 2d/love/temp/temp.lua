Person = {
  name = "Edward",
  age = 99,
}

function Person:getName()
  return self.name
end

function Person:getAge()
  return self.age
end

function Person:getInfo()
  love.graphics.print(Person:getName().." is "..tostring(Person:getAge()))
end