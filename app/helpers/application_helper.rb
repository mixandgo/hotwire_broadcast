module ApplicationHelper
  def nav_link_classes(page)
    if current_page?(page)
      "text-gray-800 transition-colors duration-200 transform dark:text-gray-200 border-b-2 border-blue-500 mx-1.5 sm:mx-6" 
    else
      "border-b-2 border-transparent hover:text-gray-800 transition-colors duration-200 transform dark:hover:text-gray-200 hover:border-blue-500 mx-1.5 sm:mx-6"
    end
  end

  def online_status(user)
    if user.online?
      tag.div class: "flex flex-row w-8 items-center" do
        tag.div(class: "flex-none w-2 h-2 bg-green-500 rounded-full") +
        tag.div("ON", class: "ml-2")
      end
    else
      tag.div class: "flex flex-row w-8 items-center" do
        tag.div(class: "flex-none w-2 h-2 bg-red-500 rounded-full") +
        tag.div("OFF", class: "ml-2")
      end
    end
  end
end
