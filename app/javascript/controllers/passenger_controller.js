import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'div', 'template' ]

  add(){   
    let content = this.templateTarget.innerHTML.replace(/TEMPLATE/g, Date.now())
    // console.log(this.templateTarget.innerHTML)
    // console.log(content)
    this.divTarget.insertAdjacentHTML('afterend', content)
  }

  remove(e){
    // console.log(e.target.closest('.nested-fields').querySelector("input[name*='_destroy']"))
    let item = e.target.closest('.nested-fields')
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }
}
