using System.Diagnostics;
using AppCrudEmpDep.Models;
using AppCrudEmpDep.Repositorios.Contrato;
using Microsoft.AspNetCore.Mvc;

namespace AppCrudEmpDep.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IGenericRepository<Departamento> _departamentoRepository;
        private readonly IGenericRepository<Empleado> _empleadoRepository;

        public HomeController(ILogger<HomeController> logger,
            IGenericRepository<Departamento> departamentoRepository,
            IGenericRepository<Empleado> empleadoRepository)
        {
            _logger = logger;
            _departamentoRepository = departamentoRepository;
            _empleadoRepository = empleadoRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public async Task<IActionResult> listaDepartamentos()
        {
            List<Departamento> _listaD = await _departamentoRepository.Lista();

            if (_listaD.Any() || _listaD != null)
            {
                return StatusCode(StatusCodes.Status200OK, _listaD);
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, _listaD);
            }
        }

        [HttpGet]
        public async Task<IActionResult> listaEmpleados()
        {
            List<Empleado> _listaE = await _empleadoRepository.Lista();

            if(_listaE.Any() || _listaE != null)
            {
                return StatusCode(StatusCodes.Status200OK, _listaE);
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, _listaE);
            }
            
        }

        [HttpPost]
        public async Task<IActionResult> guardarEmpleado([FromBody] Empleado modelo)
        {
            bool _resultGU = await _empleadoRepository.Guardar(modelo);
            if (_resultGU)
            {
                return StatusCode(StatusCodes.Status200OK, new {valor = _resultGU, msg = "OK"});
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new {valor = _resultGU, msg ="ERROR"});
            }
        }

        [HttpPut]
        public async Task<IActionResult> editarEmpleado([FromBody] Empleado modelo)
        {
            bool _resultEditU = await _empleadoRepository.Editar(modelo);
            if (_resultEditU)
            {
                return StatusCode(StatusCodes.Status200OK, new { valor = _resultEditU, msg = "OK" });
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { valor = _resultEditU, msg = "ERROR" });
            }
        }

        [HttpDelete]
        public async Task<IActionResult> eliminarEmpleado(int idEmpleado)
        {
            bool _resultElimU = await _empleadoRepository.Eliminar(idEmpleado);
            if (_resultElimU)
            {
                return StatusCode(StatusCodes.Status200OK, new { valor = _resultElimU, msg = "OK" });
            }
            else
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { valor = _resultElimU, msg = "ERROR" });
            }

        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
